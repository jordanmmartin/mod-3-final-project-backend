class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :playlist_index, :time, :state
  has_many :videos
  has_many :messages
end
