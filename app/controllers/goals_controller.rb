class GoalsController < ApplicationController

	def new
		@goal = Goal.new
		@tags = Tag.all
	end

	def create
		goal = Goal.new(goal_params)
		goal.user_id = current_user.id

		if params[:tag]
			params[:tag].each { |tag| goal.tags << Tag.find(tag) }
		end

		if goal.save

			if params[:private].to_i == 1
				goal.private = true
				goal.save
			end

			redirect_to "/users/#{current_user.id}"
		else
			flash[:notice] = goal.errors.full_messages
			@goal = Goal.new
			@tags = Tag.all
			render 'new'
		end
	end

	def show
		@goal = Goal.find(params[:id])
	end

	def edit
		@goal = Goal.find(params[:id])
		@tags = Tag.all
	end

	def update
		@goal = Goal.find(params[:id])
		@goal.assign_attributes(goal_params)

		if params[:tag]
			params[:tag].each do |tag_id|
				tag = Tag.find(tag_id)
				if !@goal.tags.include?(tag)
					@goal.tags << tag
				end
			end
		end
		
		if params[:private].to_i == 1
			@goal.private = true
		else
			@goal.private = false
		end
		
		if @goal.save
			redirect_to "/users/#{current_user.id}"
		else
			flash[:notice] = @goal.errors.full_messages
			@goal = Goal.find(params[:id])
			@tags = Tag.all
			render "edit"
		end
	end

	private

	def goal_params
		params.require(:goal).permit(:category_id, :content, :by_when, :user_id)
	end
end
