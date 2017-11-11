class VisionsController < ApplicationController

	def new
		@vision = Vision.new
	end

	def create
		vision = Vision.new(statement: params[:vision][:statement], timeframe: Date.new(params[:vision][:timeframe].to_i + Date.today.year, Date.today.month, Date.today.day), user_id: current_user.id)
		if vision.save
			redirect_to "/users/#{current_user.id}"
		else

		end
	end

end