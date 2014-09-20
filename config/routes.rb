Rails.application.routes.draw do
  resources :thegrafts

  match "*path", to: "thegrafts#index", via: "get"

  root 'thegrafts#index'


  # get 'index/create'

  # get 'index/show'

  # get 'index/update'

  # get 'index/destroy'


end
