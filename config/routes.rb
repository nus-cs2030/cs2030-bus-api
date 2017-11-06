Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'bus_services', to: 'bus_services#index'
  get 'bus_stops', to: 'bus_stops#index'
end
