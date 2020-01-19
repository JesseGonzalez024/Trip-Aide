class TripController < ApplicationController

    get '/trips/new' do
        #Takes user to erb: NEW to make new trip instance.
        
        erb :'trip/new'
    end

    post '/trips' do
        #Creates a NEW trip insatnce/ redirects to homepage.
        @trip = Trip.new(params[:trip])
        @trip.user_id = session[:user_id]
        
        if @trip.save
            redirect to  '/user/homepage'
        else
            redirect to '/trips/new'
        end
    end

    get '/trips/edit' do 
        #Takes user to erb EDIT to edit selected trip.
        
        @trip = Trip.find_by_id(params[:id])
        @current_user = User.find_by_id(session[:user_id])
        
        if @current_user
            erb :'trip/edit'
        else
            erb :welcome
        end
    end

    patch '/trips/:id/edit' do
        #Accepts new form with changes/ UPDATES trip instance data.

        @trip = Trip.find_by_id(params[:id])
        @trip.update(params[:trip])
        
        if @trip.save 
            redirect to "/trips/#{@trip.id}"
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
        @current_user = User.find_by_id(session[:user_id])
        
        if @current_user
            erb :'trip/show'
        else
            erb :welcome
        end
    end
    
end