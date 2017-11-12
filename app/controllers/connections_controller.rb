class ConnectionsController < ApplicationController

	def index
		@squad_connections = current_user.squad_connections.where(status_id: 1)
	end

	def new
		@user = User.find(params[:user_id])
	end

	def show
		@connection = Connection.find(params[:id])
	end

	def create
		connection = Connection.new(squad_member_id: params[:user_id], champ_id: current_user.id)
		connection.status = ConnectionStatus.find(1)
		connection.save
		redirect_to "/users/#{current_user.id}"
	end

	def accept
		connection = Connection.where(champ_id: params[:user_id], squad_member_id: current_user.id)
		connection.update_all(status_id: 2)
		redirect_to user_path(current_user.id)
	end

	def decline
		connection = Connection.where(champ_id: params[:user_id], squad_member_id: current_user.id)
		connection.update_all(status_id: 3)
		redirect_to user_path(current_user.id)
	end

end