class Api::V1::MapsController < ApplicationController
  
  def index
    time_range =  params[:time_range]
    event = params[:event_name]
    case event
    when "order.canceled"
      render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
    when "gofood.order.canceled"
      render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
    when "gofood.order.booked"
      render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
    when "driver.active.on.location"
      render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
    when "driver.idle.on.location"
      render json: CancelationHeatMap.get_data({"time_range" => params[:time_range]})
    end
  end
end