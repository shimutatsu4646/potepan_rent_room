class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :inn

  validates :total_price, presence: true, numericality: true, allow_blank: true
  validates :number, presence: true, numericality: {greater_than: 0}
  with_options presence: true do
    validates :start_time
    validates :finish_time
    validates :user_id
    validates :inn_id
  end
end
