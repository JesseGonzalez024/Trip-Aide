require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    #Upon entry, user is redirected to erb Welcome.       
    erb :welcome
  end

  helpers do 

    def current_user
        #If the @current_user variable has already been set then we can ignore the 'or'
        #The the "if session[:user_id]" is important because we only do the check if the user_id has been set.

        @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end
  end

end