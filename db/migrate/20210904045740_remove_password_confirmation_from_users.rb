class RemovePasswordConfirmationFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_confirmation, :string
    remove_column :users, :password, :string
  end
end
