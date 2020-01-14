class User < ActiveRecord::Base
    validates_presence_of :name, :username, :password
    has_many :trips
    has_many :flights, through: :trips
    has_secure_password

end