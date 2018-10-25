class ChannelSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :channel_id
  belongs_to :user
  belongs_to :channel
end
