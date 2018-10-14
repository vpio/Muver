class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @notifications_all = current_user.notifications.all

  end

  def create
    @notification = Proposal.notifications.new(message: "This is a notification my brosef")
    @user = Proposal.find(:id).listing.user
    @notification.save!
  end

  def update
    @notification_edit = current_user.notifications.find(params[:id])
    if @notification_edit.read_status == "reading"
      @notification_edit.update(read_status: "true")
    else
      @notification_edit.update(read_status: "reading")
    end
    redirect_to listing_path(@notification_edit.proposal.listing.id)
  end

  def destroy
    @notification_delete = current_user.notifications.find(params[:id])
    @notification_delete.destroy!
    redirect_to notifications_path
  end


  private

  def proposal_params
    params.require(:proposal).permit(:message, :user_id, :listing_id, :approved)
  end
end
