class SubGoalsController < ApplicationController

  def index
    @goal = Goal.find(params[:goal_id])
    if @goal.sub_goals.where(complete: true).count > 0
      @progress = @goal.progress
    else
      @progress = 0
    end
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
      if @goal.sub_goals.where(complete: true).count > 0
        @progress = @goal.progress
      else
        @progress = 0
      end
      respond_to do |f|
        f.html { redirect_to goal_sub_goals_path(@goal) }
        f.js
      end
    end
  end

  def complete
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:id])
    if @sub_goal.update(complete: true)
      if @goal.sub_goals.where(complete: true).count > 0
        @progress = @goal.progress
      else
        @progress = 0
      end
      respond_to do |f|
        f.js
        f.html { render 'index'}
      end
    end
  end

  def edit
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:id])
    p "IM THE EDIT METHOD"
    respond_to do |f|
      f.js
      f.html
    end
  end

  def update
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:id])
    if @sub_goal.update(content: params[:sub_goal][:content])
      p "SUB_GOOOOOOAAALLLL"
      respond_to do |f|
        f.js
        f.html { redirect_to goal_sub_goals_path(@goal) }
      end
    end
  end

  private

  def update_params
    params.require(:sub_goal).permit(:complete)
  end
end