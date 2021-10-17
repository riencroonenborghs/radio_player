class ImportStationService < AppService
  attr_reader :file

  def initialize(file:)
    @file = file
    @file_contents = nil
  end

  def call
    load_file_contents
    parse_file_contents
    return unless valid?

    import_stations
  end

  private

  attr_reader :file_contents, :parsed_file_contents

  def load_file_contents
    File.open(file, "r") do |file|
      @file_contents = file.read
    end
  end

  def parse_file_contents
    @parsed_file_contents = JSON.parse(file_contents)
  rescue => e
    errors.add(:file, e.message)
  end

  def country_code
    @country_code ||= parsed_file_contents.keys.first
  end

  def import_stations
    parsed_file_contents[country_code].each do |station|
      import_station(station: station)
    end
  end

  def import_station(station:)
    return if Station.where(country_code: country_code, name: station["name"]).exists?

    Station.create!(
      country_code: country_code,
      name: station["name"],
      website: station["site_url"],
      stream_url: station["radio_url"],
      description: station["description"]
    )
  end
end