class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    p @champ = @user.champs.last
    p "Champ's last goal content"
    p @champ.goals.last.content
  end
end