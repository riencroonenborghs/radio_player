class ApplicationController < ActionController::Base
  before_action :set_countries
  
  private

  def set_countries
    @countries = Station.countries
  end
end
