class IdeabooksController < ApplicationController
	before_action :find_ideabook, only: [:show, :dashboard]
	before_action :find_idea, only: [:show, :dashboard]

	def index
		@ideabooks = Ideabook.all.order("created_at DESC")
	end

	def show
	end

	def dashboard
	end

	private

	def find_idea
		@ideas = Idea.where(ideabook_id: @ideabook).order("created_at DESC")
	end

	def find_ideabook
		if params[:id].nil?
			@ideabook = current_ideabook
		else
			@ideabook = Ideabook.find(params[:id])
		end
	end
end