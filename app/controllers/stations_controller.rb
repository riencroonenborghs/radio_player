class StationsController < ApplicationController
  before_action :set_country_code

  def index
    @stations = Station.by_country_code(@country_code)
    @station = @stations.find_by(id: params[:station_id]) if params[:station_id]
  end

  private

  def set_country_code
    @country_code = params[:country_code]
  end
end
