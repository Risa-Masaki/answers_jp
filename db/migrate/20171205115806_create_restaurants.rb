class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :name
      t.text :address
      t.text :image
      t.text :url
      t.timestamps
    end
  end
end
