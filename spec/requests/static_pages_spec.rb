require 'spec_helper'

describe "Static pages" do

  describe "首页" do

    it "should have the content '多少钱？'" do
      visit '/static_pages/home'
      expect(page).to have_content('多少钱？')
    end

    it "should have the title '首页'" do
      visit '/static_pages/home'
      expect(page).to have_title("多少钱？ | 首页")
    end
  end

  describe "帮助" do

  	it "should have the content '帮助'" do
  	  visit '/static_pages/help'
  	  expect(page).to have_content('帮助')
  	end

    it "should have the title '帮助'" do
      visit '/static_pages/help'
      expect(page).to have_title("多少钱？ | 帮助")
    end
  end

  describe "关于我们" do

    it "should have the content '关于我们'" do
      visit '/static_pages/about'
      expect(page).to have_content('关于我们')
    end

    it "should have the title '关于我们'" do
      visit '/static_pages/about'
      expect(page).to have_title("多少钱？ | 关于我们")
    end
  end
end