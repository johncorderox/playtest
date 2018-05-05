Rails.application.routes.draw do

  root 'welcome#index'

  get '/applications/:id'  => 'welcome#applications'

  post '/applications'     => 'welcome#submitApplication'

  get '/playtests'         => 'playtests#index'

  patch '/playtests/:id'   => 'playtests#notes'

  delete '/playtests/:id'  => 'playtests#destroy'



  resources :playtests

  devise_for :users

end
