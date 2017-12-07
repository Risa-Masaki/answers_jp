class RemovePhotoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_name, :string
    remove_column :users, :image, :string
    remove_column :users, :avatar_content_type, :string
    remove_column :users, :avatar_file_size, :integer
    remove_column :users, :avatar_updated_at, :datetime
    add_column :users, :avatar, :text
  end
end
