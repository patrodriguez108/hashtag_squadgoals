class GoalsController < ApplicationController

	def new
		@tags = Tag.grab_random_tags
	end

	def create
		p params
		goal = Goal.new(content: params[:goal][:content], by_when: Date.new(params[:goal][:by_when].to_i, Date.today.month, Date.today.day), user_id: current_user.id, category_id: params[:goal][:category_id].to_i)
		# if goal.save
			if params[:private].to_i == 1
				goal.private = true
				# goal.save
			end
			redirect_to "/users/#{current_user.id}"

		# else

		# end
	end

	def show
		@goal = Goal.find(params[:id])
	end

end