class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :playlist_index, :time, :state, :updated_at
  has_many :videos
  has_many :messages
  has_many :channel_subscriptions
  has_many :users, through: :channel_subscriptions
  attribute :active do
    object.updated_at > 5.minutes.ago
  end
  attribute :view_count do
    object.channel_subscriptions.length
  end
end
