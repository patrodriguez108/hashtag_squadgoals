class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search])
    else
      flash[:notice] = "There are no users matching your search."
    end
    render
  end


end