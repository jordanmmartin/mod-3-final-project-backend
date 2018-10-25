class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :playlist_index, :time, :state
  has_many :videos
  has_many :messages
  has_many :channel_subscriptions
  has_many :users, through: :channel_subscriptions
  attribute :view_count do
    object.channel_subscriptions.length
  end
end
