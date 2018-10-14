class UsersController < ApplicationController

  def show
    authenticate_user!
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        render json: {
          user:        @user
        }
      end
    end
  end

  def new
  end

  def create
    current_user.avatar.attach(params[:avatar])
    redirect_to user_profile_path
  end

  private
   def user_avatar
     params.require(:user).permit(:avatar)
   end
end
