class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+\z/ }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    validates :available_time, format: {with: /\A\d\d:\d\d[ap]m-\d\d:\d\d[ap]m\z/ }
    has_secure_password
    after_initialize :set_defaults

    def set_defaults
        self.available_time = '00:00am-00:00pm'
    end
end
