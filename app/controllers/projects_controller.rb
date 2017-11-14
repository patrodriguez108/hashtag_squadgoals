class ProjectsController < ApplicationController

	def index
		@projects = current_user.project
	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])

	end

	def update
		project = Project.find(params[:id])
		project.assign_attributes(project_params)

		if project.save
			redirect_to project_path(project.id)
		else

		end
	end

	private

		def project_params
			params.require(:project).permit(:name, :description)
		end
end