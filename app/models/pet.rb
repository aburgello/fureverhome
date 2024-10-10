class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :location, presence: true

  has_many :adoptions, dependent: :destroy

  def display_image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      image_url.presence || 'default_image.png'
    end
  end
end
