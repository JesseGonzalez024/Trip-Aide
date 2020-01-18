class User < ActiveRecord::Base

    validates_presence_of :name, :username
    validates :username, uniqueness: true
    has_many :trips
    has_many :flights, through: :trips
    has_secure_password

end