class Inn < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :price, presence: true, numericality: true
  with_options presence: true do
    validates :name
    validates :adress
    validates :user_id
  end
end
