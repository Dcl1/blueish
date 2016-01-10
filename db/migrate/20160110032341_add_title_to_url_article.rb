class AddTitleToUrlArticle < ActiveRecord::Migration
  def change
    add_column :url_articles, :title, :string
  end
end
