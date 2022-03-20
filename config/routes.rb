Rails.application.routes.draw do
  resources :countries, only: [:index]
  resources :stations, only: [:index]

  get "/countries/:country_code/stations/:station_id/star" => "stations#star", as: :star
  get "/countries/:country_code/stations/:station_id/unstar" => "stations#unstar", as: :unstar

  # get "/countries/:country_code/stations" => "countries#stations"
  # get "/stations/:id" => "stations#show"

  root to: "countries#index"
end
