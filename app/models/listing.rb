class Listing < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
end
