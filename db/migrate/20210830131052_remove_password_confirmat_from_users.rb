class RemovePasswordConfirmatFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_confirmat, :string
  end
end
