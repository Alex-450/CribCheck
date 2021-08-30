class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :review
  has_many :messages
end
