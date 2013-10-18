class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
      t.string :password_digest  # 存放密码地方，与Gemfile里的bcrypt配合
    end
  end
end
