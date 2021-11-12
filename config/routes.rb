# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  scope "(:locale)", locale: /en|de/ do
    resources :pokemon do
      get "search", on: :collection
    end

    devise_for :users

    root "pokemon#index"
  end
end
