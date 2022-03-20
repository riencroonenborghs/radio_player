module ApplicationHelper
  def starred?(country_code, station_id)
    return false unless session[:starred]
    return false unless session[:starred][country_code]

    session[:starred][country_code].include?(station_id)
  end
end
