Rails.application.routes.draw do
  #root 'application#index'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/vars' => 'application#env_vars'
  get '/protected' => 'application#protected' 
end
