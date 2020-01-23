class TripController < ApplicationController

    get '/trips/new' do
        if !logged_in?
            redirect to '/'
        end

        erb :'/trip/new'
        #Takes user to erb: NEW to make new trip instance  
    end

    post '/trips' do
        #Creates a NEW trip insatnce/ redirects to homepage.
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
        #Takes user to erb EDIT to edit selected trip.   
        @trip = Trip.find_by_id(params[:id])
        #@erb_address = '/trip/edit'
        validate
        erb :'/trip/edit'

    end

    patch '/trips/:id' do
        #Accepts new form with changes/ UPDATES trip instance data.
            
            @trip = Trip.find_by_id(params[:id])
            @trip.update(params[:trip])
            
            if @trip.save
                @route_address = "/trips/#{@trip.id}"
                validate?
            end
    end

    delete '/trips/:id' do
        #Deletes trip instance/ redirects to homepage.     
            @trip = Trip.find_by_id(params[:id])
            @trip.destroy
            redirect to '/user/homepage'
    end

    get '/trips/:id' do
        #Takes user to the erb SHOW.
        @trip = Trip.find_by_id(params[:id])           
        @flight = Flight.find_by_trips_id(@trip.id)
        @erb_address = "/trip/show"
        validate?
    end
    
end