class Content < ActiveRecord::Base

	has_many :articles
	has_many :url_articles
	accepts_nested_attributes_for :articles
	accepts_nested_attributes_for :url_articles

	belongs_to :user
end
