class AddHouseInfoToUsers < ActiveRecord::Migration
  def change
      add_column :users, :profile_picture, :string
      add_column :users, :personal_description, :text

      add_column :users, :home_street_address, :string
      add_column :users, :home_city, :string
      add_column :users, :home_state, :string
      add_column :users, :home_zip_code, :string

      add_column :users, :house_picture, :string
      add_column :users, :house_description, :text
  end
end
