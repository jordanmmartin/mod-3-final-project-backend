class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :videos
  has_many :channel_subscriptions
  has_many :channels, through: :channel_subscriptions
end
