class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+\z/ }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    has_secure_password
    
    # Geolocation (NOTE: must call save on the object to trigger the coordinate creation)
    geocoded_by :full_street_address   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
    
    def full_street_address
        self.home_street_address + " " + self.home_city + " " + self.home_state + " " + self.home_zip_code
    end
end
