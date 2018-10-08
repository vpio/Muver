class Listing < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode

  def address
    [street.upcase, city.capitalize, state.upcase].compact.join(', ')
  end

end
