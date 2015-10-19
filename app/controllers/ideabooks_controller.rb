class IdeabooksController < ApplicationController
	def index
		@ideabooks = Ideabook.all.order("created_at DESC")
	end

	def show
		@ideabook = Ideabook.find(params[:id])
		@ideas = Idea.where(ideabook_id: @ideabook).order("created_at DESC")
	end
end