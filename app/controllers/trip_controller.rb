class TripController < ApplicationController

    get '/trips/new' do
        if !logged_in?
            redirect to '/'
        end
        erb :'/trip/new'
    end

    post '/trips' do
        if !logged_in?
            redirect to '/'
        end
        
        @trip = Trip.new(params[:trip])
        @trip.user_id = session[:user_id]
        
        if @trip.save
            redirect to  '/user/homepage'
        else
            redirect to '/trips/new'
        end
    end

    get '/trips/:id/edit' do  
        @trip = Trip.find_by_id(params[:id])
        validate
        erb :'/trip/edit'

    end

    patch '/trips/:id/edit' do
        @trip = Trip.find_by_id(params[:id])
        validate
        @trip.update(params[:trip])
        
        if @trip.save
            redirect to "/trips/#{@trip.id}"           
        end
    end

    delete '/trips/:id' do
        @trip = Trip.find_by_id(params[:id])
        validate
        @trip.destroy
        redirect to '/user/homepage'
    end

    get '/trips/:id' do
        @trip = Trip.find_by_id(params[:id])           
        @flight = Flight.find_by_trip_id(@trip.id)
        validate
        erb :'/trip/show'
    end
    
end