class Channel < ApplicationRecord
  has_many :videos
  has_many :messages
end
