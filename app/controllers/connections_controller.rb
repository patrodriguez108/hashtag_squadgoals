class ConnectionsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
	end

	def create
		connection = Connection.new(squad_member_id: params[:user_id], champ_id: current_user.id)
		connection.status = ConnectionStatus.find(1)
		connection.save
		redirect_to "/users/#{current_user.id}"
	end

end