class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :inns, dependent: :destroy
end
