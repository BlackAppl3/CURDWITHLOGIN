Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'information#index'
  root 'users#index'
  resources :information
  resources :users, only: [:index, :create]
  resources :sessions, only: [:create]
  get 'information/show/:id' => "information#show"
  get 'information/delete/:id' => "information#delete"
  get 'log_out' => "sessions#destroy"
  get 'users/reload' => "users#reload"
  get 'users/index' => "users#index"
end
