class SightingsController < ApplicationController
    def index
        sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
        render json: sightings
      end
    
      def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting
      end
    
      def create
        @sighting = Sighting.create(sighting_params)
        if @sighting.valid?
            render json: @sighting
        else
            render json: @sighting.error
        end
      end
    
      def destroy
        @sighting = Sighting.find(params[:id])
        if @sighting.destroy
            render json: @sighting
        else
            render json: @sighting.error
        end
      end
    
      def update
        @sighting = Sighting.find(params[:id])
        @sighting.update(sighting_params)
        if @sighting.valid?
            render json: @sighting
        else
            render json: @sighting.error
        end
      end
    
      private
      def sighting_params
        params.require(:sighting).permit(:date, :lat_long, :steve_irwin_id)
      end
end
