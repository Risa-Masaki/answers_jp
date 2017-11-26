class ChangeDatatypeQuestionIdOfAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :question_id, :integer
  end
end
