class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8 }
    has_secure_password
end
