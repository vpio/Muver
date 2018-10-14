class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  validates_uniqueness_of :proposal_id
end
