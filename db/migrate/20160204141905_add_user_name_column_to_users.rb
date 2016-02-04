class AddUserNameColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_name, :string, default: "NoName"
  end
end