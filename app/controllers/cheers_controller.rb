class CheersController < ApplicationController

	def create
		goal = Goal.find(params[:goal_id])
		if goal.already_cheered?(current_user.id) || goal.own_goal?(current_user.id)
			redirect_to root_path
		else
			goal.cheers << Cheer.create(goal_id: params[:goal_id], user_id: current_user.id)
			redirect_to user_path(goal.user_id)
		end
	end

end