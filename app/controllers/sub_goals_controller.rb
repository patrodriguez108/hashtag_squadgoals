class SubGoalsController < ApplicationController

  def index
    @sub_goals = SubGoal.all
  end

  def new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @sub_goal = @goal.sub_goals.new(params[:sub_goal].permit(:content))
    if @sub_goal.save
      redirect_to goal_path(@goal)
    end
  end

  def update
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:id])
    respond_to do |format|
    if @sub_goal.update_attributes(params[:sub_goal])
      format.js
    else

    end
  end


end