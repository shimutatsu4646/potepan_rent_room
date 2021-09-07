class User < ApplicationRecord
  # has_one_attached  :icon_image
  has_many :reservations
  has_many :inns, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, presence: true, confirmation: true,
                       allow_blank: true, length: { minimum:6 }
  
end
