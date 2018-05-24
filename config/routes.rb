Rails.application.routes.draw do

  root 'welcome#index'

  get '/company'           => 'company#index'

  get '/company/edit'      => 'company#edit'

  get '/playtests'         => 'playtests#index'

  patch '/playtests/:id'   => 'playtests#notes'

  delete '/playtests/:id'  => 'playtests#destroy'

  resources :applications
  resources :playtests
  resources :testers

  devise_for :users

end
