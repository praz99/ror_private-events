Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index new create show]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events, only: %i[new index show create]
  get 'events_attending', to: 'events#attended_event'
  post 'events_attending', to: 'events#add_attended_event'
 
  root 'events#index'
end
