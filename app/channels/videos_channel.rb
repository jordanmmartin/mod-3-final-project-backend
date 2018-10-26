class VideosChannel < ApplicationCable::Channel
  def subscribed
    # routing, argument is where the stream is opened from
    stop_all_streams
    @channel = Channel.find(params[:id])
    @current_user = User.find(params[:userid])
    @channel_subscription = ChannelSubscription.find_or_create_by(user: @current_user, channel: @channel)
    stream_from "channel_#{@channel.id}"
    delegate_host
  end

  def unsubscribed
    stop_all_streams
    @channel_subscription.destroy
    if @current_user == @host
      ActionCable.server.broadcast("channel_#{@channel.id}", "The host has left.")
    end
      ActionCable.server.broadcast("channel_#{@channel.id}", "view_count": "#{@channel.channel_subscriptions.length}")
  end

  def receive(data)
      ActionCable.server.broadcast("channel_#{@channel.id}", data)
  end

  def sync_videos(data)
    ActionCable.server.broadcast("channel_#{@channel.id}", data)
    @channel.update(time: data["time"].to_f, playlist_index: data["playlist_index"].to_i, state: data["state"].to_i)
  end

  def add_video(data)
    ActionCable.server.broadcast("channel_#{@channel.id}", data)
  end

  def send_message(data)
    ActionCable.server.broadcast("channel_#{@channel.id}", data)
  end

  def delegate_host
    @host = @channel.channel_subscriptions.first.user
    if @host == @current_user
      stream_from "channel_#{@channel.id}_host"
      say_hi_to_host
    end
  end

  def say_hi_to_host
    ActionCable.server.broadcast("channel_#{@channel.id}_host", "YOU'RE THE HOST")
  end
end
