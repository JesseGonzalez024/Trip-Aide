#registration routher Get from application_controller 


#Registration 2 routes
#Get registration form from welcome page and directs to registration erb view
#Recieves registration form vian POST router method 


#Log-in 2 steps
#Recives Log in button from from welcome page erb, redirects to log in prompt erb view
#Recives log in form from erb view and redirects them if valid user to their account

#Homepage
#If user session is still current user then router method directs them to their account
#User acount lets them view the upcoming trips. Also with an a button option for previous trips and current trips.
#User is given an option to signoff

class UserController < ApplicationController
    get '/user/register' do
        erb :'user/register'
    end

    get '/user/login' do
       
        
        erb :'user/login'
    end

    post '/registration' do 
        binding.pry
    end

    post '/login' do 
        binding.pry
    end


end