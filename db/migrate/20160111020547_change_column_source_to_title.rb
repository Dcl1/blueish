class ChangeColumnSourceToTitle < ActiveRecord::Migration
  def change
  	rename_column :post, :source, :title
  end
end
