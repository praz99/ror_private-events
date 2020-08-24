Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index new create show]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events, only: %i[new index show create]
  post 'add_events_attending', to: 'events#attended_event'
  post 'rem_events_attending', to: 'events#unattend_event'
end
