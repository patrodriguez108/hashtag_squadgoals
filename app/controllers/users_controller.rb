class UsersController < ApplicationController

  def new
    @user = User.new
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
      flash[:notice] = @user.errors.full_messages
      respond_to do |f|
        f.html { render 'new' }
        f.json { render json: flash[:notice] }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    if params[:search]
      @search = params[:search]
      @found_users = User.search(@search)
    else
      flash[:notice] = "There are no users matching your search."
    end
    render
  end

  def cronofy
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to user_path(@user.id)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  def user_params
    params.require(:user).permit(:profile_pic, :given_name, :family_name, :username, :email, :password, :password_confirmation)
  end
end