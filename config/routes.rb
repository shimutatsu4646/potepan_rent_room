Rails.application.routes.draw do
  root 'inns#index'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # get 'signup', to: "users#new"
  
  resources :users
  resources :inns
  resources :reservations do  
    collection do
      post :confirm
    end
  end
  
end
