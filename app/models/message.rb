class Message < ApplicationRecord
  belongs_to :user
  belongs_to :adoption

  validates :content, presence: true
end
