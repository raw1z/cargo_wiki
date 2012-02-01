class CreateCargoWikiArticles < ActiveRecord::Migration
  def change
    create_table :cargo_wiki_articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
