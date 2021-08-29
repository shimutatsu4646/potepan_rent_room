class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :total_price
      t.date :start_time
      t.date :finish_time
      t.integer :user_id
      t.integer :inn_id

      t.timestamps
    end
  end
end
