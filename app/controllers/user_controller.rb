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
    get '/register' do
        erb :'user/register'
    end

    get '/login' do
        erb :'user/login'
    end

    #must add logic to determine if credentials fit requirments 
    post '/registration' do
        if params[:username]=="" || params[:password]==""
            erb :error
       end
       
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
            binding.pry
            session[:user_id] = @user.id
            redirect to 'user/homepage'
        else
            erb :error
        end
    end

    #must complete what the error page looks like
    post '/login' do
        if params[:username]=="" || params[:password]==""
            erb :error
       end
    
        @user = User.find_by(username: params[:username])
            if  @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect to '/user/homepage'
            else
                erb :error
            end
    end

    get '/user/homepage' do 
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            erb :'user/homepage'
        else
            erb :error
        end
    end

    get '/logout' do 
        session.clear
        erb :welcome
    end
    
end