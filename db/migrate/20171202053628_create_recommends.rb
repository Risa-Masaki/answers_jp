class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer        :writer_id
      t.integer        :user_id
      t.text           :text
      t.timestamps null: false
    end
  end
end
