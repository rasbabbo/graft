Rails.application.routes.draw do
	resources :grafts, except: [:edit, :new]
	resources :graft_templates

	get "legislators/:state_id", to: "grafts#find_legislators"

  # match "*path", to: "grafts#index", via: "get"
  
  root to: "grafts#index"
end
