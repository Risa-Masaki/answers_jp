class ChangeDatatypeWorkIdOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :work_id, :integer
  end
end
