class CreateCargoArticles < ActiveRecord::Migration
  def change
    create_table :cargo_articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
