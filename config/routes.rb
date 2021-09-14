Rails.application.routes.draw do
  root 'inns#index'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users
  resources :inns do
    collection do
      get :search
      get :login_user_index
    end
  end
  resources :reservations do
    collection do
      post :confirm
    end
  end
end
