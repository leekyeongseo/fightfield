Rails.application.routes.draw do
  #devise_for :users
  #resources :templates
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #root 'templates#index'
  root 'fights#main'
  

  #get '/', to: 'feeds#index'
  
 
  get '', to: 'fights#main'
  get '/stat_board', to: 'fights#stat_board'
  get '/ongoing', to: 'fights#ongoing'
  get '/setting', to: 'fights#setting'
  get '/leader_board', to: 'fights#leader_board'
  post '/applying_action', to: 'fights#fight'
  get '/accept_fight/:id', to: 'fights#accept_fight'
  get '/reject_fight/:id', to: 'fights#reject_fight'
  post '/start_fight', to: 'fights#start_fight'
  get '/hakjum/:id', to: 'fights#hakjum'
  get '/diet/:id', to: 'fights#diet'
  get '/esports/:id', to: 'fights#esports'
  get '/sports/:id', to: 'fights#sports'
  get '/free/:id', to: 'fights#free'
  get '/css_test', to: 'fights#css_test'
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
