class User < ActiveRecord::Base
    def initialize(username, password, name, email='', credit_card_number='', address='')
        @name = name
        @username = username
        @password = password
        @email = email
        @credit_card_number = credit_card_number
        @address = address
    end
end