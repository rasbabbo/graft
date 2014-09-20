Rails.application.routes.draw do
 root to: "grafts#index"
 resources :thegrafts, except[:edit, :new]
 resources :graft_templates

end
