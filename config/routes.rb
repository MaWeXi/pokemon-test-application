# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  scope "(:locale)", locale: /en|de/ do

    root "pokemon#index"

    resources :pokemon do
      get "search", on: :collection
    end

    devise_for :users, controllers: { profiles: "users/profiles" }

    namespace :users do
      get "profiles/show"
      get "profiles/edit"
    end
  end
end
