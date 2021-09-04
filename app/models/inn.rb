class Inn < ApplicationRecord
  # has_one_attached :image
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
end
