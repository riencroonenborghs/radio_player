class Station < ApplicationRecord
  validates :country_code, :name, :stream_url, presence: true

  scope :by_country_code, -> (code) { where(country_code: code).order(name: :asc) }

  def self.country_codes
    order(country_code: :asc).select(:country_code).distinct.pluck(:country_code)
  end

  def self.countries
    {}.tap do |data|
      country_codes.each do |country_code|
        data[country_code] = ISO3166::Country[country_code].name
      end
    end
  end
end
