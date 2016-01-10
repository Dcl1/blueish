class CreateUrlArticles < ActiveRecord::Migration
  def change
    create_table :url_articles do |t|
      t.string :source

      t.timestamps null: false
    end
  end
end
