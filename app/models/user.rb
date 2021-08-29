class User < ApplicationRecord
  has_many :reservations
  has_many :inns, dependent: :destroy
end
