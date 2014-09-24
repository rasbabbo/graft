Rails.application.routes.draw do
	resources :grafts, except: [:edit, :new]
	resources :graft_templates

	get "legislators/:state_id", to: "grafts#find_legislators"
	get "legislator/:cid", to: "grafts#find_legislator"
	get "donors/:cid", to: "grafts#find_donors"
	get "industries/:cid", to: "grafts#find_industries"

  # match "*path", to: "grafts#index", via: "get"
  
  root to: "grafts#index"
end
