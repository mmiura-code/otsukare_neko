Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  resources :diaries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/callback', to: 'otsukare#callback'
  
  devise_for :users, controllers: {
  omniauth_callbacks: "omniauth_callbacks"
}
end
