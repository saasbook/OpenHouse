class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    has_secure_password
end
