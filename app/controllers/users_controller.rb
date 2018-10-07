class UsersController < ApplicationController

  def show
    authenticate_user!
    @user = User.find(params[:id])
  end

end
