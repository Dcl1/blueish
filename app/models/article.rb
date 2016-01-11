class Article < ActiveRecord::Base
	belongs_to :user

	belongs_to :content

	has_many :reviews

	has_attached_file :image, styles:{ medium: "400 x 400>", thumb: "100x100>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
