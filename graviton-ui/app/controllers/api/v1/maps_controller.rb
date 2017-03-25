class Api::V1::MapsController < ApplicationController
  
  def index
    Rails.logger.info params[:time_range]
    render json: SampleData.data
  end
end