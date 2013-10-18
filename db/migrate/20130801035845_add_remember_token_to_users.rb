# 增加记忆权标来取回用户，使得用户一次登陆，关掉浏览器再打开也还在登陆状态

class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    add_index :users, :remember_token
  end
end