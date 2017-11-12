class UsersController < ApplicationController

  def new
    @user = User.new
    @tags = Tag.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      respond_to do |f|
        f.html { redirect_to new_vision_path }
        f.js
      end
    else
      render 'new'
    end
  end

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

  private

  def user_params
    params.require(:user).permit(:profile_pic, :given_name, :family_name, :username, :email, :password, :password_confirmation)
  end


end