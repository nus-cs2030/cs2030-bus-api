Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bus_services, only: [:show]
  resources :bus_stops, only: [:show]
end
