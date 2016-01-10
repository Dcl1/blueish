class ContentsController < ApplicationController

  	# GET /contents
  	# GET /contents.json
	def index
		@contents = Content.all
		@hi = "hi"
	end

end
