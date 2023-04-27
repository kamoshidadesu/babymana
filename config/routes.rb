Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'
  resources :calendars, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :diaries
  resources :managements, only: [:index, :new]
end
