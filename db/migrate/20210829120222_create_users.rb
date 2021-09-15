class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :name
      t.string :email
      t.string :password
      t.string :password_confirmat
      t.string :icon_image
      t.text :introduction
      t.integer :reservation_id
      t.integer :inn_id

      t.timestamps
    end
  end
end
