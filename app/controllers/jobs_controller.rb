class JobsController < ApplicationController
  def index
    @approved = current_user.proposals.where(approved: true)
    @proposals = current_user.proposals
    @requested = current_user.proposals.where(approved: false)
  end
end
