Rails.application.routes.draw do
  #devise_for :users
  resources :templates
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'templates#index'

  get '/', to: 'feeds#index'

  get '/fight', to: 'fights#main'
  get '/fight/stat_board', to: 'fights#stat_board'
  get '/fight/ongoing', to: 'fights#ongoing'
  get '/fight/setting', to: 'fights#setting'
  get 'fight/leader_board', to: 'fight#leader_board'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
