class User < ActiveRecord::Base[5.2]
    validates_presence_of :name, :username, :password
    has_many :trips
    has_many :flights, through: :trips
    has_secured_password





    
end