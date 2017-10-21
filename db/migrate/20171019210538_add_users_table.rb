class AddUsersTable < ActiveRecord::Migration
    def up
        create_table :users do |u|
            u.string :name
            u.string :username
            u.string :password
            u.string :email
            u.text :address
            u.string :credit_card_number
        end
    end
    
    def down
        drop_table :users
    end
end
