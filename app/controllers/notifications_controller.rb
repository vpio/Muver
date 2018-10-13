class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @notification = Proposal.notifications.new(message: "This is a notification my brosef")
    @proposal =
    @user = Proposal.find(:id).listing.user
    @notification.save!
  end

  def update
    @notification_edit = current_user.notifications.find(params[:id])
    @notification_edit.update(read_status: true)
    redirect_to listing_path(@notification_edit.proposal.listing.id)
  end


  private

  def proposal_params
    params.require(:proposal).permit(:message, :user_id, :listing_id, :approved)
  end
end
