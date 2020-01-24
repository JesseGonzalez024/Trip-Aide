require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
        @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def belongs_to_user?(trip)
      if @trip != nil
        if current_user.id != @trip.user_id
          binding.pry
          erb :welcome
        end
      end
    end

    def validate
      if !logged_in? || @trip == nil || current_user.id != @trip.user_id
        redirect to '/'
      end
    end
  end

end