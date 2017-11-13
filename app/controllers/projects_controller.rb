class ProjectsController < ApplicationController

	def index
		@projects = current_user.current_projects
	end

	def show
		@project = Project.find(params[:id])
	end

end