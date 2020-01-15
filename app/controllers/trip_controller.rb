class TripController < ApplicationController
    get '/trips/new' do
        erb :'trip/new'
    end

    post 'user/trip/new' do
        binding.pry
    end

end