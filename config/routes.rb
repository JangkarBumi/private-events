# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events/new'
  resources :users
  resources :sessions
  resources :events
  get '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
