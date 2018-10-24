class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_video_url, :playlist_index, :time, :state
  has_many :videos
end
