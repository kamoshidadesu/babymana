Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index'
  resources :managements 
  resources :calendars 
  resources :diaries
end
