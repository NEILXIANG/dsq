class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                    :password_confirmation)
  end
end
