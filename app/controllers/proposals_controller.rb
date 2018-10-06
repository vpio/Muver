class ProposalsController < ApplicationController

  def new
    @proposal = Proposal.new
  end

  def create
    puts "============="
    p params[:message]
    @proposal = Proposal.new(proposal_params)
    @proposal.save
    redirect_to request.referrer
  end

  private

  def proposal_params
    params.require(:proposal).permit(:message, :user_id, :listing_id, :approved)
  end



end
