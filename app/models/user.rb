class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"

  has_many :proposals, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  def user_profile_avatar
    if @user.avatar.attached?
      image_tag url_for(@user.avatar), :class => 'card-img-top profile-pic'
    else
      image_tag 'avatar-placeholder.png', :class => 'card-img-top profile-pic'
    end
  end
end
