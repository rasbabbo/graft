Rails.application.routes.draw do
 root to: "grafts#index"
 resources :grafts, except: [:edit, :new]
 resources :graft_templates

end
