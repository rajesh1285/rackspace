Rails.application.routes.draw do
  devise_for :users
  root 'friendships#index'
  resources :friendships
  get 'short_url', to: 'friendships#short_url'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
