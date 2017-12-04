class AddCloudMultipleHousePictures < ActiveRecord::Migration
  def change
    add_column :users, :cloud_house_image_ids, :string, array: true, default: []
  end
end
