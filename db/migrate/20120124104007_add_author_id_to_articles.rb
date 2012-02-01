class AddAuthorIdToArticles < ActiveRecord::Migration
  def change
    add_column :cargo_wiki_articles, :author_id, :integer
  end
end
