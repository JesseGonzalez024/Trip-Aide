class User < ActiveRecord::Base
    validates_presence_of :name, :username
    validates :username, uniqueness: true
    has_many :trips
    #def trip 
    # Trip.all.select {|trip| trip.user_id == self.id}
    # SELECT * FROM trip WHERE user_id = ? 
    #end 
    #has_many :flights, through: :trips
    has_secure_password
    #macros write functions for us 
    #authenticate 
    #password=()
end