Rails.application.routes.draw do

  root 'welcome#index'

  get '/playtests'         => 'playtests#index'

  patch '/playtests/:id'   => 'playtests#notes'

  delete '/playtests/:id'  => 'playtests#destroy'

  resources :applications
  resources :playtests

  devise_for :users

end
