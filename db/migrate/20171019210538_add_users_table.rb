class AddUsersTable < ActiveRecord::Migration
    def up
        create_table :users do |u|
            u.string :email
            u.string :password

            u.string :street_address
            u.string :city
            u.string :state
            u.string :zip_code
            
            u.string :first_name
            u.string :last_name
            u.string :credit_card_number
            u.string :expiration_date
            u.string :cvv
        end
    end
    
    def down
        drop_table :users
    end
end
