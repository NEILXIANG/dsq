require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_content('多少钱？') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| 首页') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 关注", href: following_user_path(user)) }
        it { should have_link("1 粉丝", href: followers_user_path(user)) }
      end
    end
  end

  describe "help" do
    before { visit help_path }

    it { should have_content('帮助') }
    it { should have_title(full_title('帮助')) }
  end

  describe "about" do
    before { visit about_path }

    it { should have_content('关于我们') }
    it { should have_title(full_title('关于我们')) }
  end

  describe "contact" do
    before { visit contact_path }

    it { should have_content('联系我们') }
    it { should have_title(full_title('联系我们')) }
  end
end