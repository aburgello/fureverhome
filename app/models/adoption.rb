class Adoption < ApplicationRecord


  validates :adopter_name, presence: true
  validates :adopter_email, presence: true
  validates :message, presence: true
  validates :status, presence: true
end
