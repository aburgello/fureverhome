class Pet < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :breed, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Optional: Add an enum for status
  enum status: { available: 'available', adopted: 'adopted' }
end
end
