class CreateCargoWikiUsers < ActiveRecord::Migration
  def change
    create_table :cargo_wiki_users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
