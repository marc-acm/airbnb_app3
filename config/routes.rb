Rails.application.routes.draw do
    
  resources :bookings
  resources :rooms do
    resources :reviews, :bookings
  end

 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "users/registrations" }
  

  get '/auth/facebook', to: 'users/omniauth_callbacks#passthru'
  get 'auth/facebook/callback', to: 'users/omniauth_callbacks#facebook'
  get '/sign_in', to:'devise/sessions#new'
  post '/sign_in', to: 'devise/sessions#create'
  delete '/sign_out', to: 'devise/sessions#destroy'
  get '/edit', to: 'devise/registrations#edit'
  root 'pages#info'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
