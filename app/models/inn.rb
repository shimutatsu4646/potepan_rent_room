class Inn < ApplicationRecord
  belongs_to :users
  has_many :reservations, dependent: :destroy
  
end
