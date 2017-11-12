class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      p @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      p "WTF"
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end