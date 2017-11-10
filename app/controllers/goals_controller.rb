class GoalsController < ApplicationController

	def new
	end

	def create
		p goal = Goal.new(content: params[:goal][:content], by_when: Date.new(params[:goal][:by_when].to_i, Date.today.month, Date.today.day), category_id: params[:goal][:category_id].to_i)
		
	end

end