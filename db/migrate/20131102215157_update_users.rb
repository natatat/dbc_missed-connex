class UpdateUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :email, :string
    remove_column :users, :username
  end

  def down
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string
  end
end
