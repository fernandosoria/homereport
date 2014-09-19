Homereport::Application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  resources :clients, except: [:show]

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
