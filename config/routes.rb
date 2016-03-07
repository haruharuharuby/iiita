Rails.application.routes.draw do

  authenticated :user do
    root "articles#index", as: "authenticated_root"
  end
  root "landings#show", as: "non_authenticated_root"

  devise_for :user, :controllers => { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords" }

  resources :users, param: :name, conserns: :followable, only: [:index, :show] do
    member do
      get "following_tags"
      get "following_users"
      get "followed_users"
    end
  end

  concern :followable do
    post "follow", on: :member
    post "unfollow", on: :member
  end

  resources :articles
  resources :stocks
  resources :user_follows, only:[:create, :destroy]
  resources :tags, param: :name, concerns: :followable
  resources :tag_follows, only:[:create, :destroy]
end
