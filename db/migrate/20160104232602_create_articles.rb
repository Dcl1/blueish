class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :source
      t.text :description

      t.timestamps null: false
    end
  end
end