require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #upon entry, user is directed to web welcome page
  #welcome page displays two options- register or sign up.
  #Either option will take user to the corresponging program view

  get "/" do
    erb :welcome
  end

end