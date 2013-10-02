class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy] #事前过滤器能用所有动作，须限制
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])  # 按分页取回用户
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "该用户已被删除."
    redirect_to users_url
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)  # 使用健壮参数，保护管理员不被盗用
    if @user.save
      sign_in @user
      flash[:success] = "欢迎来到 多少钱？网站"
      redirect_to @user  # 自动寻找用户资料页面
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "个人资料更改成功"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # 事前过滤器

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
