class TripController < ApplicationController
    get '/user/trips/new' do
        erb :'trip/new'
    end

    post '/user/trips/new' do
        
        @trip = Trip.new(name: params[:name], destination: params[:destination])
        @trip.start_date = @trip.date_setter(params[:start_date])
        @trip.end_date = @trip.date_setter(params[:end_date])
        if @trip.save
            @trip.user_id = session[:user_id]
        end
        redirect to  '/user/homepage'
    end

    get '/user/trips/past_trips' do
        binding.pry

        erb :'/trip/show'
    end

end