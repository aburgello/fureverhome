class Adoption < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :pet

  # Validations
  validates :status, presence: true

  # Optional: Add an enum for status
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
end
