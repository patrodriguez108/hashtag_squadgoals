class ProjectObjectivesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @project_objective = ProjectObjective.new
  end

  def create
    @project = Project.find(params[:project_id])
    p "====="
    p @project
    p "====="
    p project_objective_params
    project_objective = ProjectObjective.new(project_objective_params)
    project_objective.project_id = @project.id

    if project_objective.save
      redirect_to "/projects/#{@project.id}"
    end
  end

  private

  def project_objective_params
    params.require(:project_objective).permit(:content, :by_when, :project_id)
  end
end