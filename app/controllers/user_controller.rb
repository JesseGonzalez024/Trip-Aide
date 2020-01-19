class UserController < ApplicationController
    
    get '/register' do
        #Takes use to erb: registration.

        erb :'user/register'
    end

    get '/login' do
        #Takes user to erb login.
        erb :'user/login'
    end

    #must add logic to determine if credentials fit requirments 
    post '/registration' do
        #Creates new user instance/ redirects to homepage.

        if params[:username]=="" || params[:password]==""
            erb :'user/register'
        end
        
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to 'user/homepage'
        else
            erb :'user/login'
        end
    end
    
    post '/login' do
        #Authenticates user logging in/redirects to homepage.
        
        if params[:username]=="" || params[:password]==""
            erb :error
        end
        @user = User.find_by(username: params[:username])
            if  @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect to '/user/homepage'
            else
                erb :welcome
            end
    end

    get '/user/homepage' do
        #Verifies user/ takes user to erb homepage.
        
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            erb :'user/homepage'
        else
            erb :welcome
        end
    end

    get '/logout' do
        #Clears session/ user logged out. 
        
        session.clear
        erb :welcome
    end
    
    get '/user/inspiration' do
        
        @current_user = User.find_by_id(session[:user_id]) 
        if @current_user
            erb :'user/inspiration'
        end
    end
 
end