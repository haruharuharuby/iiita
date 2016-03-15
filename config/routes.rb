Rails.application.routes.draw do

  authenticated :user do
    root "articles#index", as: "authenticated_root"
  end
  root "landings#show", as: "non_authenticated_root"

  devise_for :user, :controllers => { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords" }

  concern :followable do
    post "follow", on: :member
    post "unfollow", on: :member
  end

  resources :users, param: :name, concerns: :followable, only: [:index, :show] do
    member do
      get "following_tags"
      get "following_users"
      get "followed_users"
    end
    resources :comments
  end

  resources :articles
  resources :stocks
  resources :tags, param: :name, concerns: :followable
end
