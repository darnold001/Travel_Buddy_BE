class TripsController < ApplicationController


    def create
        @trip = Trip.Create!(trip_params)
        render json: @trip
    end

    def index
        @trips = Trip.all
        render json: @trip
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
        params.require(:trip).permit(:tripName, :rating, :trip_id, :created_at, :updated_at)
    end

    def set_user
        @trip = Trip.find(params[:id])
    end

end
