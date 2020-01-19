class FlightController < ApplicationController

    get '/flights/:id/new' do
        @trip = Trip.find_by_id(params[:id])
        
        erb :'flight/new'
    end

    post '/flights/:id' do
        @flight = Flight.new(airline: params[:airline], confirmation: params[:confirmation])
        @flight.seat = params[:seat]
        @flight.depart_time = params[:depart_time]
        @flight.depart_from = params[:depart_from]
        @flight.arrival_time = params[:arrival_time]
        @flight.arrival_to = params[:arrival_to]
        @flight.trips_id = params[:id]
        
        if @flight.save
            redirect to '/user/homepage'
        else
            redirect to '/flights/:id/new'
        end
    end 

end