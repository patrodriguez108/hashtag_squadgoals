class SubGoalsController < ApplicationController

  def index
    @sub_goals = SubGoal.all
  end

  def new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @goal = Goal.find(params[:goal_id])
    # Add logic to check the by_when of the goal vs the by_when of the sub_goal
    @sub_goal = @goal.sub_goals.new(params[:sub_goal].permit(:content, :by_when))
    if @sub_goal.save
      redirect_to goal_path(@goal)
    end
  end

  def update

  end


end