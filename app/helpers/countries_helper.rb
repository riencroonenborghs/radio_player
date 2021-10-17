module CountriesHelper
  def countries_to_array(countries)
    countries.to_a.map { |list|  list[0], list[1] = list[1], list[0] }
  end

  def stations_to_array(stations)
    stations.map { |station|  [station.name, station.id] }
  end
end
