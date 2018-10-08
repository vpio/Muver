class UsersController < ApplicationController

  def show
    authenticate_user!
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    current_user.avatar.attach(params[:avatar])
    redirect_to "/users/#{current_user.id}"
  end

  private
   def user_avatar
     params.require(:user).permit(:avatar)
   end

end
