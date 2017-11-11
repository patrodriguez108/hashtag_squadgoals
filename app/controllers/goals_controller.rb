class GoalsController < ApplicationController

	def new
		@goal = Goal.new
		@tags = Tag.all
	end

	def create
		goal = Goal.new(content: params[:goal][:content], by_when: Date.new(params[:goal][:by_when].to_i, Date.today.month, Date.today.day), user_id: current_user.id, category_id: params[:goal][:category_id].to_i)
		params[:tag].each { |tag| goal.tags << Tag.find(tag) }
		if goal.save
			if params[:private].to_i == 1
				goal.private = true
				goal.save
			end
			redirect_to "/users/#{current_user.id}"
		else

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
		# p params
		p "================"
		p params[:tag]
		p "================"
		@goal = Goal.find(params[:id])
		@goal.assign_attributes(goal_params)
		params[:tag].each do |tag_id|
			tag = Tag.find(tag_id)
			if !@goal.tags.include?(tag)
				@goal.tags << tag
			end
		end
		if @goal.save
			redirect_to "/users/#{current_user.id}"
		else
			flash[notice] = "Try again"
			render "goal#edit"
		end
	end

	private

	def goal_params
		params.require(:goal).permit(:category_id, :content, :by_when, :user_id)
	end
end