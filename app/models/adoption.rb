class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :adopter_email, presence: true
  validates :message, presence: true
end
