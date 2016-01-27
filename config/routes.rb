Rails.application.routes.draw do

  authenticated :user do
    root 'articles#index', as: "authenticated_root"
  end
  root 'landings#show', as: "non_authenticated_root"

  devise_for :user, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords'}
  resources :articles

end
