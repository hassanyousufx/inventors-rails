class IdeasController < ApplicationController
	before_action :authenticate_ideabook!, except: [:show]
	before_filter :require_permission
	before_action :find_ideabook
	before_action :find_idea, only: [:show, :edit, :update, :destroy]

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
		@ideas = Idea.where(ideabook_id: @ideabook).order("created_at DESC").limit(5).reject { |e| e.id == @idea.id }
	end

	def edit
	end

	def update
		if @idea.update idea_params
			redirect_to ideabook_idea_path(@ideabook, @idea), notice: "Episode was successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@idea.delete
		redirect_to root_path
	end

	private

	def idea_params
		params.require(:idea).permit(:title, :description, :idea_thumbnail)
	end

	def find_ideabook
		@ideabook = Ideabook.find(params[:ideabook_id])
	end

	def find_idea
		@idea = Idea.find(params[:id])
	end

	def require_permission
		@ideabook = Ideabook.find(params[:ideabook_id])
		if current_ideabook != @ideabook
			redirect_to root_path, notice: "Sorry, you're not allowed to view that page"
		end
	end
end
 