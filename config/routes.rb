Rails.application.routes.draw do
  root 'cities#index'
  resources :cities, only: :index
  
  # post '/configure_current_city', to: 'cities#configure_current_city'
end
