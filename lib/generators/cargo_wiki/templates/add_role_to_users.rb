class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :cargo_wiki_users, :role, :string
  end
end
