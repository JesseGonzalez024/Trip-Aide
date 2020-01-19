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

    patch '/flights/:id/show' do 
        binding.pry
    end

end