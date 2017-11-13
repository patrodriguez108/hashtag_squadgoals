class SubGoalsController < ApplicationController

  def index
    @goal = Goal.find(params[:goal_id])
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
    p "i'm the update in the controller"
    if @sub_goal.update_attributes(update_params)
      respond_to do |format|
        format.js
        format.html { render 'index'}
      end
    end
  end

  private

  def update_params
    params.require(:sub_goal).permit(:completed)
  end


end