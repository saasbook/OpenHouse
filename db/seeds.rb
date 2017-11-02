# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'alejandro@gmail.com', password: 'boondogle', first_name: 'Alejandro', last_name: 'Salazar', 
            personal_description: 'I am a dumb Colombian.', billing_first_name: 'Alejandro', billing_last_name: 'Salazar', 
            billing_street_address: '2700 Hearst Avenue', billing_city: 'Berkeley', billing_state: 'CA', 
            billing_zip_code: '94720', credit_card_number: '1234123412341234', expiration_date: '06/22', cvv: '137', 
            home_street_address: '2520 Ridge Road', home_city: 'Berkeley', home_state: 'CA', home_zip_code: '94709', 
            house_description: 'A beautiful college property, right in the heart of UC Berkeley, with access to a dirty pool.',
            searchable: true)
            
User.create(email: 'jared@gmail.com', password: 'boondogle', first_name: 'Jared', last_name: 'Ryan', 
            personal_description: 'I am an American.', billing_first_name: 'Jared', billing_last_name: 'Ryan', 
            billing_street_address: '2350 Hearst Avenue', billing_city: 'Berkeley', billing_state: 'CA', 
            billing_zip_code: '94709', credit_card_number: '4321432143214321', expiration_date: '08/22', cvv: '731', 
            home_street_address: '2368 Le Cont Avenue', home_city: 'Berkeley', home_state: 'CA', home_zip_code: '94709', 
            house_description: 'The working Church.',
            searchable: true)
            
User.create(email: 'batman@gmail.com', password: 'boondogle', first_name: 'Bruce', last_name: 'Wayne', 
            personal_description: 'I am the Batman.', billing_first_name: 'Wayne', billing_last_name: 'Wayne', 
            billing_street_address: '2520 Hearst Avenue', billing_city: 'Berkeley', billing_state: 'CA', 
            billing_zip_code: '94709', credit_card_number: '2222222222222222', expiration_date: '01/22', cvv: '115', 
            home_street_address: '2151 Pedro Ave', home_city: 'Milpitas', home_state: 'CA', home_zip_code: '95035', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true)
            
User.create(email: 'superman@gmail.com', password: 'boondogle', first_name: 'Clark', last_name: 'Kent', 
            personal_description: 'I am Superman.', billing_first_name: 'Clark', billing_last_name: 'Kent', 
            billing_street_address: '2760 Hearst Avenue', billing_city: 'Berkeley', billing_state: 'CA', 
            billing_zip_code: '94709', credit_card_number: '1122112211221122', expiration_date: '05/22', cvv: '125', 
            home_street_address: '18 Hallock Dr', home_city: 'Washingtonvle', home_state: 'NY', home_zip_code: '10992', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true)
            
User.create(email: 'wonderwoman@gmail.com', password: 'boondogle', first_name: 'Diana', last_name: 'Amazon', 
            personal_description: 'I am Womderwoman.', billing_first_name: 'Diana', billing_last_name: 'Amazon', 
            billing_street_address: '2760 Hearst Avenue', billing_city: 'Berkeley', billing_state: 'CA', 
            billing_zip_code: '94709', credit_card_number: '1122112211221122', expiration_date: '05/22', cvv: '125', 
            home_street_address: '41a Kirkland Rd', home_city: 'Silver City', home_state: 'NM', home_zip_code: '88061', 
            house_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat.',
            searchable: true)
            
