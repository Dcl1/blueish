class AddAttachmentImageToUrlArticles < ActiveRecord::Migration
  def self.up
    change_table :url_articles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :url_articles, :image
  end
end
