class AddAuthorIdToArticles < ActiveRecord::Migration
  def change
    add_column :cargo_articles, :author_id, :integer
  end
end
