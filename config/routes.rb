Rails.application.routes.draw do
    resources :grafts, except: [:edit, :new]

  match "*path", to: "grafts#index", via: "get"
  
  root to: "grafts#index"
end
