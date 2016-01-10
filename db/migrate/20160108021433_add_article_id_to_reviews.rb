class AddArticleIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :article_id, :integer
  end
end
