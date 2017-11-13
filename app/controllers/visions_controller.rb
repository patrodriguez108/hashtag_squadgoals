class VisionsController < ApplicationController

	def new
		@tags = Tag.all
	end

	def create
		vision = Vision.new(statement: params[:vision][:statement], timeframe: Date.new(params[:vision][:timeframe].to_i + Date.today.year, Date.today.month, Date.today.day), user_id: current_user.id)
		if vision.save
			if current_user.visions.length > 1
				redirect_to user_path(current_user.id)
			else
				redirect_to new_goal_path
			end
		else

		end
	end
end