class SubGoalsController < ApplicationController


  def new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @goal = Goal.find(params[:goal_id])
  end

  def index
    @goal = Goal.find(params[:goal_id])
  end

end