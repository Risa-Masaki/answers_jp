class RemoveWorkIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :work_id, :integer
  end
end
