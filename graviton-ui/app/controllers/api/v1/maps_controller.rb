class Api::V1::MapsController < ApplicationController
  
  def index
    Rails.logger.info params[:time_range]
    render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
  end
end