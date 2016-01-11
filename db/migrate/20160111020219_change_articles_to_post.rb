class ChangeArticlesToPost < ActiveRecord::Migration
  def change
  	rename_table :articles, :post
  end
end
