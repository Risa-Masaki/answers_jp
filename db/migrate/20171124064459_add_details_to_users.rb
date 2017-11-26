class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :age, :string
    add_column :users, :station, :string
    add_column :users, :apply, :string
    add_column :users, :work_id, :string
    add_column :users, :availability, :text
    add_column :users, :interest, :text
    add_column :users, :introduction, :text
  end
end
