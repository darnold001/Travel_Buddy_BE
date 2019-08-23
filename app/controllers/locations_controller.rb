class LocationsController < ApplicationController
    def create
        @location = Location.create(location_params)
        render json: @location
    end

    def index
        @locations = Location.all
        render json: @locations
    end
    
    def show
        @location = Location.find_by(trip_id: params[:id])
        render json: @location
    end

    def update
        @location.update(location_params)
        head :no_content
    end

    def destroy
        @location = Location.find(params[:id])
        @location.destroy
        head:no_content
    end


private

    def location_params
        params.require(:location).permit(:locName, :country, :city, :lat, :long, :notes, :trip_id)
    end

    def set_user
        @location = Location.find(params[:id])
    end
end
