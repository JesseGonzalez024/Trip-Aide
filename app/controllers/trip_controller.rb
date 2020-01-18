class TripController < ApplicationController

    get '/trips/new' do
        #Takes user to erb: NEW to make new trip instance.
        
        erb :'trip/new'
    end

    post '/trips' do
        #Creates a NEW trip insatnce/ redirects to homepage.

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
        @trip.name = params[:name]
        @trip.destination = params[:destination]
        @trip.start_date = params[:start_date]
        @trip.end_date = params[:end_date]
        @trip.save

        redirect to "/trips/#{@trip.id}"
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
        @current_user = User.find_by_id(session[:user_id])
        
        if @current_user
            erb :'trip/show'
        else
            erb :welcome
        end
    end
    
end