Rails.application.routes.draw do
  devise_for :users
  resources :chirps

  # You can have the root of your site routed with "root"
  root 'chirps#index'

  get '/awesome', to: 'chirps#awesome'

end
