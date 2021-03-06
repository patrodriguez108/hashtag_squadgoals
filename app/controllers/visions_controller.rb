class VisionsController < ApplicationController

	def index
		@visions = current_user.visions.order("timeframe DESC")
	end

	def new
		@tags = Tag.all
	end

	def create
		vision = Vision.new(statement: params[:statement], user_id: current_user.id)
		vision.set_timeframe(params[:timeframe])
		
		if vision.save

			if current_user.visions.length > 1
				redirect_to user_path(current_user.id)
			else
				redirect_to new_goal_path
			end

		else
			@errors = vision.errors.full_messages

			@tags = Tag.all
			render 'new'
		end
	end
end