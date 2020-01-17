class TripController < ApplicationController
    
    get '/trips/new' do
        #takes user to erb new to make new trip instance
        
        erb :'trip/new'
    end

    post '/user/trips/new' do

        @trip = Trip.new(name: params[:name], destination: params[:destination])
        @trip.start_date = params[:start_date]
        @trip.end_date = params[:end_date]
        @trip.user_id = session[:user_id]
        
        if @trip.save
            redirect to  '/user/homepage'
        else
            redirect to '/trips/new'
        end
    end

    get '/trips/past_trips' do
        #takes user to trips that have already passed
        binding.pry

        erb :'/trip/show'
    end

    get '/trips/edit/:id' do 
        #takes user to erb edit to edit selected trip
        
        binding.pry
        if @current_user
            erb :'trip/show'
        else
            erb :error
        end
    end

    post '/trips/edit' do
        binding.pry

    end

    post '/trips/delete' do
        binding.pry
    end

    get '/trips/show/:id' do
        #takes user to the erb show page to review trip details
       
        @trip = Trip.find_by_id(params[:id])
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            erb :'trip/show'
        else
            erb :error
        end
    end
end