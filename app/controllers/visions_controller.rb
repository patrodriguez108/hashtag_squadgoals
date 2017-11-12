class VisionsController < ApplicationController

	def new
	end

	def create
		vision = Vision.new(statement: params[:vision][:statement], timeframe: Date.new(params[:vision][:timeframe].to_i + Date.today.year, Date.today.month, Date.today.day), user_id: current_user.id)
		if vision.save
			if current_user.visions.length > 1
				redirect_to user_path(current_user.id)
			else
				respond_to do |f|
					f.html { redirect_to new_goal_path }
					f.js
				end
			end
		else

		end
	end

end