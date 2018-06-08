Rails.application.routes.draw do

  root 'welcome#index'

  get '/company'                  => 'company#index'

  get '/company/edit'             => 'company#edit'

  patch '/company'                => 'company#update'

  delete '/company/dap'           => 'company#destroy_all_playtests'

  get '/playtests'                => 'playtests#index'

  post '/playtests/:id/backup'    => 'playtests#backup'

  patch '/playtests/openapp'      => 'playtests#openapp'

  patch '/playtests/:id/owner'        => 'playtests#owner'

  patch '/playtests/closeapp'     => 'playtests#closeapp'

  patch '/playtests/:id'          => 'playtests#notes'

  delete '/playtests/:id'         => 'playtests#destroy'

  patch '/company/aws'            => 'company#aws'

  resources :applications
  resources :playtests
  resources :testers
  resources :logs, only: [:index, :destroy]

  devise_for :users

end
