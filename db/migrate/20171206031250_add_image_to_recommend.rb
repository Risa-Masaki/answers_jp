class AddImageToRecommend < ActiveRecord::Migration
  def change
    add_column :recommends, :image, :text
  end
end
