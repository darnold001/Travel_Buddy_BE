class TripsController < ApplicationController


    def create
        @trip = Trip.create(trip_params)
        render json: @trip
    end

    def index
        @trips = Trip.all
        render json: @trips
    end
    
    def show
        @trip = Trip.find(params[:id])
        render json: @trip
    end

    def update
        @trip.update(trip_params)
        head :no_content
    end

    def destroy
        @trip = Trip.find(params[:id])
        @trip.destroy
        head:no_content
    end


private

    def trip_params
        params.require(:trip).permit(:trip_name, :rating, :user_id, :created_at, :updated_at)
    end

    def set_user
        @trip = Trip.find(params[:id])
    end

end
