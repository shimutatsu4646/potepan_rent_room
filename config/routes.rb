Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'inns/index'
  get 'inns/show'
  get 'inns/new'
  get 'inns/edit'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
