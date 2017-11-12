class SubGoalsController < ApplicationController


  def new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @sub_goal = @goal.sub_goals.create(params[:sub_goal].permit(:content, :by_when))
    redirect_to goal_path(@goal)
  end

  def index
    @goal = Goal.find(params[:goal_id])
  end

end