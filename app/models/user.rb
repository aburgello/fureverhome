class User < ApplicationRecord
   # Associations
   has_many :pets, dependent: :destroy
   has_many :adoptions, dependent: :destroy

   # Validations
   validates :email, presence: true, uniqueness: true
   validates :encrypted_password, presence: true

   # Devise related validations if you are using Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
