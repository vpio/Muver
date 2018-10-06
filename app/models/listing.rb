class Listing < ApplicationRecord
  validates :description, presence: true
  belongs_to :user

  has_many :proposals
end
