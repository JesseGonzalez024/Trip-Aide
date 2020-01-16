class TripController < ApplicationController
    get '/trips/new' do
        erb :'trip/new'
    end

    post '/user/trips/new' do
        
        @trip = Trip.new(name: params[:name], destination: params[:destination])
        @trip.start_date = @trip.date_setter(params[:start_date])
        @trip.end_date = @trip.date_setter(params[:end_date])
        @trip.user_id = session[:user_id]
        
        if @trip.save
            redirect to  '/user/homepage'
        else
            redirect to '/trips/new'
        end
    end

    get '/trips/past_trips' do
        binding.pry

        erb :'/trip/show'
    end

    get '/trips/show/:id' do
        @trip = Trip.find_by_id(params[:id])
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            erb :'trip/show'
        else
            erb :error
        end
    end

end