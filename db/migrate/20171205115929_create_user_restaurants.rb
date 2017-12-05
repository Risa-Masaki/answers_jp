class CreateUserRestaurants < ActiveRecord::Migration
  def change
    create_table :user_restaurants do |t|
      t.string :user_id
      t.string :restaurant_id
      t.timestamps
    end
  end
end
