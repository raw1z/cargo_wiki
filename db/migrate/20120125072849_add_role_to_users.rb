class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :cargo_users, :role, :string
  end
end
