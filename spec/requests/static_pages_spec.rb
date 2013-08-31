require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "首页" do
    before { visit root_path }

    it { should have_content('多少钱？') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| 首页') }
  end

  describe "帮助" do
    before { visit help_path }

    it { should have_content('帮助') }
    it { should have_title(full_title('帮助')) }
  end

  describe "关于我们" do
    before { visit about_path }

    it { should have_content('关于我们') }
    it { should have_title(full_title('关于我们')) }
  end

  describe "联系我们" do
    before { visit contact_path }

    it { should have_content('联系我们') }
    it { should have_title(full_title('联系我们')) }
  end
end