class VideoSerializer < ActiveModel::Serializer
  attributes :id, :url, :user_id, :channel_id
end
