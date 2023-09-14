Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "dashboard#index"

  scope "(:locale)", locale: /en|fr/ do
    devise_for :users, skip: [:registrations]

    resources :sites
    resources :roles
    resources :users

    get "dashboard", to: "dashboard#index"
  end
end
