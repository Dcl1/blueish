class AddImageSourceToUrlArticle < ActiveRecord::Migration
  def change
    add_column :url_articles, :image_source, :string
  end
end
