class Api::V1::MapsController < ApplicationController
  
  def index
    render json: SampleData.data
  end
end