class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :adoptions, dependent: :destroy
  has_many :requests, through: :adoptions, source: :pet
  has_many :messages

  validates :name, presence: true

  def owner?
    role == 'owner'
  end

  def adopter?
    role == 'adopter'
  end
end
