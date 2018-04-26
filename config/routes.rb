Rails.application.routes.draw do

  root 'welcome#index'

  get '/playtests' => 'playtests#index'

  get '/dashboard' => 'dashboard#index'

  resources :playtests

  devise_for :users

end
