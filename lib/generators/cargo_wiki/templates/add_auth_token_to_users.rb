class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :cargo_wiki_users, :auth_token, :string

  end
end
