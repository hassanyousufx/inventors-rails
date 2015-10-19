class IdeasController < ApplicationController
	before_action :find_ideabook
	before_action :find_idea, only: [:show]

	def new
		@idea = @ideabook.ideas.new
	end

	def create
		@idea = @ideabook.ideas.new idea_params
		if @idea.save
			redirect_to ideabook_idea_path(@ideabook, @idea)
		else
			render 'new'
		end
	end

	def show
		@ideas = Idea.where(ideabook_id: @ideabook).order("created_at DESC").reject { |e| e.id == @idea.id }
	end

	private

	def idea_params
		params.require(:idea).permit(:title, :description)
	end

	def find_ideabook
		@ideabook = Ideabook.find(params[:ideabook_id])
	end

	def find_idea
		@idea = Idea.find(params[:id])
	end
end
