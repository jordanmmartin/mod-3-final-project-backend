class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :channel_id
  attribute :username do
    object.user.username
  end
  belongs_to :channel
end
