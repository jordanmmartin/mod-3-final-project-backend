class VideoSerializer < ActiveModel::Serializer
  attributes :id, :url, :user_id, :channel_id
  belongs_to :user
  belongs_to :channel
end
