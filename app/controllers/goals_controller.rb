class GoalsController < ApplicationController

	def new
	end

	def create
		goal = Goal.new(content: params[:goal][:content], by_when: Date.new(params[:goal][:by_when].to_i, Date.today.month, Date.today.day), user_id: current_user.id, category_id: params[:goal][:category_id].to_i)
		params[:tags].split(",").map { |tag| goal.tags << Tag.find_by(name: tag) }
		if goal.save
			if params[:private].to_i == 1
				goal.private = true
				goal.save
			end
			
		else

		end
	end

end