MyGists::Application.routes.draw do
 
  get "static_pages/login_required"
  get "static_pages/login_failed"
  match "gist/stats", to: "gists#stats", via: [:get, :post]
  resources :gists

  root 'gists#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: 'static_pages#login_failed', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
