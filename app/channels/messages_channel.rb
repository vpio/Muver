class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages:#{params['user_1_id']}:#{params['user_2_id']}"
  end
   def unsubscribed
    stop_all_streams
  end
end
