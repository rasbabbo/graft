Rails.application.routes.draw do
 root to: "graft#index"
 resources :users, except: [:edit, :new]
 resources :graft_templates

end
