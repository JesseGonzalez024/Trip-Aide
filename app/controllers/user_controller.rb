class UserController < ApplicationController
    
    get '/register' do
        erb :'user/register'
    end

    get '/login' do
        erb :'user/login'
    end

    post '/registration' do
        if params[:username]=="" || params[:password]==""
            erb :'user/register'
        end
        
        @user = User.new(params[:user])
        
        if @user.save
            session[:user_id] = @user.id
            redirect to 'user/homepage'
        else
            erb :'user/login'
        end
    end
    
    post '/login' do
        if params[:username]=="" || params[:password]==""
            erb :'/user/login'
        end
        @user = User.find_by(username: params[:username])
            
            if  @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect to '/user/homepage'
            else
                redirect to '/'
            end
    end

    get '/user/homepage' do
       erb :'/user/homepage'
    end

    get '/logout' do
        session.clear
        erb :welcome
    end
    
    get '/user/inspiration' do
        erb :'user/inspiration'
    end 
end