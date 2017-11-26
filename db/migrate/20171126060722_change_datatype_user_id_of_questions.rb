class ChangeDatatypeUserIdOfQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :user_id, :integer
  end
end
