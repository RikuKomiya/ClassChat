class PostChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "post:chanel_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def post(data)
    message = Message.create!(lecture_id: data['lecture_id'], text: data['message'])
    PostChannel.broadcast_to("chanel_#{params[:room]}", message)
  end
end
