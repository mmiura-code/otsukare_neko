Rails.application.routes.draw do
  #root 'static_pages#top'
  root 'diaries#index'
  #root 'sessions#new' 
  #mount_devise_token_auth_for 'User', at: 'auth'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/callback', to: 'otsukare#callback'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[index new create show]
  resources :diaries, only: %i[index new create show]

end
