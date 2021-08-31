Rails.application.routes.draw do
  # get 'reservations/index'
  # get 'reservations/show'
  # get 'inns/index'
  # get 'inns/show'
  # get 'inns/new'
  # get 'inns/edit'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  
  # root 'inns/search'
  root 'users#new'
  resources :users
  resources :inns
  # resources :reservation, only: [:index, :show, :new, :create, :destory]
  # get 'reservations/confirm', to: 'reservations#confirm'
  resources :reservations do  
    collection do
      post :confirm
    end
  end
  
end
