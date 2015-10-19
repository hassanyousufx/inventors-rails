class IdeabooksController < ApplicationController
	def index
		@ideabooks = Ideabook.all.order("created_at DESC")
	end

	def show
		@ideabooks = Ideabook.find(params[:id])
	end
end