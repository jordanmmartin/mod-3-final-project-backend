class VideosChannel < ApplicationCable::Channel
  def subscribed
    # routing, argument is where the stream is opened from
    stop_all_streams
    @channel = Channel.find(params[:id])
    stream_from "channel_#{@channel.id}"
  end

  def unsubscribed
    stop_all_streams
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
end
