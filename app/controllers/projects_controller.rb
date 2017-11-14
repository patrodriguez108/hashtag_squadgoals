class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
	end

end