class StationsController < ApplicationController
  before_action :set_country_code

  def index
    # session[:starred] = nil
    @stations = Station.by_country_code(@country_code)
    @station = @stations.find_by(id: params[:station_id]) if params[:station_id]

    @starred = (session[:starred] || {}).map do |country_code, station_ids|
      Station.where(country_code: country_code, id: station_ids)
    end.flatten
  end

  def star
    country_code = params[:country_code]
    station_id = params[:station_id]

    session[:starred] ||= {}
    session[:starred][country_code] ||= []
    session[:starred][country_code] << station_id.to_i
    redirect_to stations_path(country_code: country_code, station_id: station_id)
  end

  def unstar
    country_code = params[:country_code]
    station_id = params[:station_id]

    redirect_to stations_path(country_code: country_code, station_id: station_id) and return unless session[:starred] && session[:starred][country_code]
    
    session[:starred][country_code].delete(station_id.to_i)
    redirect_to stations_path(country_code: country_code, station_id: station_id)
  end

  private

  def set_country_code
    @country_code = params[:country_code]
  end
end
