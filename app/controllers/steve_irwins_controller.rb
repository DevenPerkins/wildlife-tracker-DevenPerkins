class SteveIrwinsController < ApplicationController
    def index
        @steves = SteveIrwin.all
        render json: @steves
      end
    
      def show
        @steve = SteveIrwin.find(params[:id])
        render json: @steve.as_json(include: :sightings)
      end
    
      def create
        @steve = SteveIrwin.create(steve_params)
        if @steve.valid?
            render json: @steve
        else
            render json: @steve.error
        end
      end
    
      def destroy
        @steve = SteveIrwin.find(params[:id])
        if @steve.destroy
            render json: @steve
        else
            render json: @steve.error
        end
      end
    
      def update
        @steve = SteveIrwin.find(params[:id])
        @steve.update(steve_params)
        if @steve.valid?
            render json: @steve
        else
            render json: @steve.error
        end
      end
    
      private
      def steve_params
        params.require(:steve_irwin).permit(:common_name,:latin_name,:kingdom)
      end
end
