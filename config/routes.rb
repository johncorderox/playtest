Rails.application.routes.draw do

  root 'welcome#index'

  get '/playtests'        => 'playtests#index'

  delete '/playtests/:id' => 'playtests#destroy'

  get '/dashboard'        => 'dashboard#index'

  resources :playtests

  devise_for :users

end
