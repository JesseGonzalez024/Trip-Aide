class FlightController < ApplicationController

    get '/flights/:id/new' do
        @trip = Trip.find_by_id(params[:id])
        
        erb :'flight/new'
    end

    post '/flights/:id' do
        @flight = Flight.new(params[:flight])
        @flight.trips_id = params[:id]
        
        if @flight.save
            redirect to "/trips/#{@flight.trips_id}"
        else
            redirect to '/flights/:id/new'
        end
    end 

    get '/flights/:id/show' do
        @flight = Flight.find_by_id(params[:id])
        @trip = Trip.find_by_id(@flight.trips_id)
        @current_user = User.find_by_id(session[:user_id])

        if @current_user
            erb :'/flight/show'
        else
            erb :'user/login'
        end
    end

    get '/flights/:id/edit' do
        
        @flight = Flight.find_by_id(params[:id])
        @current_user = User.find_by_id(session[:user_id])
        
        if @current_user
            erb :'/flight/edit'
        else
            erb :'user/login'
        end
    end
end