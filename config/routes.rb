Rails.application.routes.draw do

  get 'logs/index'

  get 'logs/destroy'

  root 'welcome#index'

  get '/company'              => 'company#index'

  get '/company/edit'         => 'company#edit'

  patch '/company'            => 'company#update'

  delete '/company/dap'       => 'company#destroy_all_playtests'

  get '/playtests'            => 'playtests#index'

  patch '/playtests/openapp'  => 'playtests#openapp'

  patch '/playtests/closeapp' => 'playtests#closeapp'

  patch '/playtests/:id'      => 'playtests#notes'

  delete '/playtests/:id'     => 'playtests#destroy'

  resources :applications
  resources :playtests
  resources :testers
  resources :logs
  
  devise_for :users

end
