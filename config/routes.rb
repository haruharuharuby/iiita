Rails.application.routes.draw do

  authenticated :user do
    root 'articles#index', as: "authenticated_root"
  end
  root 'landings#show', as: "non_authenticated_root"

  devise_for :user, :controllers => { registrations: 'registrations', sessions: 'users/sessions'}
  resources :articles

end
