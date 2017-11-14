class AddCloudPicturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cloud_profile_picture, :string
    add_column :users, :cloud_profile_picture_id, :string
    add_column :users, :cloud_house_picture, :string
    add_column :users, :cloud_house_picture_id, :string
  end
end
