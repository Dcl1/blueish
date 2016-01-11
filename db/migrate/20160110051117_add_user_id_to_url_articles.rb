class AddUserIdToUrlArticles < ActiveRecord::Migration
  def change
  	add_column :url_articles, :user_id, :integer
  end
end
