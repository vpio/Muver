class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  after_create_commit :broadcast_message

  scope :between, ->  (user_1, user_2) do
    where(
      "(sender_id = :user_1_id AND recipient_id = :user_2_id) OR
      (sender_id = :user_2_id AND recipient_id = :user_1_id)",
      user_1_id: user_1.id,
      user_2_id: user_2.id
    )
  end

  private

  def action_cable_channel
    "messages:#{[sender_id, recipient_id].sort.join(':')}"
  end

  def broadcast_message
    ActionCable.server.broadcast(action_cable_channel, {})
  end

end
