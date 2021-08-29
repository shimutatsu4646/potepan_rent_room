class CreateInns < ActiveRecord::Migration[6.1]
  def change
    create_table :inns do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :adress
      t.string :image
      t.string :user_id
      t.string :reservation_id

      t.timestamps
    end
  end
end
