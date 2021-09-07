class RemoveInnIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :inn_id, :integer
    remove_column :users, :reservation_id, :integer
    remove_column :inns, :reservation_id, :integer    
  end
end
