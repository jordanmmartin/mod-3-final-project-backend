class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :channel_id
  attribute :username do
    object.user.username
  end
  attribute :time do
    object.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%I:%M%p")
  end
  belongs_to :channel
end
