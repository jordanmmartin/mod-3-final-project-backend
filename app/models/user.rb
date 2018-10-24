class User < ApplicationRecord
  has_many :videos
  has_many :messages
end
