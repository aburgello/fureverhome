class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :adopter_name, presence: true
  validates :adopter_email, presence: true
  validates :message, presence: true
  validates :status, presence: true
end
