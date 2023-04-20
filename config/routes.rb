Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'
  resources :calendars, only: [:index, :new, :edit]
  resources :daiaries, only: [:index, :new]
  resources :managements, only: [:index, :new]
end
