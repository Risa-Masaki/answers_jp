class ChangeDatatypeUserIdOfAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :user_id, :integer
  end
end
