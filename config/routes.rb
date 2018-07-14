Rails.application.routes.draw do
  #devise_for :users
  resources :templates
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'templates#index'
  get '/', to: 'feeds#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
