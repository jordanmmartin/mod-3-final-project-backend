class SendVideoDetailsJob < ApplicationJob
  queue_as :default

  def perform()
      ActionCable.server.broadcast("videos_channel", {
        "video": "08NKvqaqOIg"
        })
  end
end
