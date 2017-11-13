class SubGoalsController < ApplicationController

  def index
    @goal = Goal.find(params[:goal_id])
    @sub_goals = SubGoal.all
  end

  def new
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.new
    respond_to do |f|
      f.html { redirect_to new_goal_sub_goal_path(@goal) }
      f.js
    end
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @sub_goal = @goal.sub_goals.new(params[:sub_goal].permit(:content))
    if @sub_goal.save
      p "=========="
      p "The sub-goal saved!"
      p "=========="
      respond_to do |f|
        f.html { redirect_to goal_path(@goal) }
        f.js
      end
    end
  end

  def update
    p "I'M IN UPDATE."
    p params
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:id])
    if @sub_goal.update(completed: true)
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