class CheersController < ApplicationController

	def create
		goal = Goal.find(params[:goal_id])
		goal.cheers << Cheer.create(goal_id: params[:goal_id], user_id: current_user.id)
		redirect_to user_path(goal.user_id)
	end

end