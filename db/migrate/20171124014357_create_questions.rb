class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :name
      t.text        :text
      t.text        :image
      t.timestamps
    end
  end
end
