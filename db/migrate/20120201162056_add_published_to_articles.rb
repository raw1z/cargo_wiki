class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :cargo_wiki_articles, :published, :boolean, :default => true
  end
end
