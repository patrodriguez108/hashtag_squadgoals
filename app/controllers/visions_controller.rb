class VisionsController < ApplicationController

	def new
	end

	def create
		vision = Vision.new(statement: params[:vision][:statement], timeframe: Date.new(params[:vision][:timeframe].to_i + Date.today.year, Date.today.month, Date.today.day), user_id: current_user.id)
		if vision.save
			redirect_to new_goal_path
		else

		end
	end

end