class VideosChannel < ApplicationCable::Channel
  def subscribed
    # routing, argument is where the stream is opened from
    stream_from 'videos_channel'
    ActionCable.server.broadcast('videos_channel', body: "hello")
  end
end
