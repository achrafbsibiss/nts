Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "dashboard#index"

  scope "(:locale)", locale: /en|fr/ do
    devise_for :users, path_names: { registration: "registrations" }
    resources :sites
    resources :roles
    resources :users
    resources :equipments
    resources :clients

    get "dashboard", to: "dashboard#index"
  end
end
