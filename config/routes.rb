Rails.application.routes.draw do

   root 'welcome#index'
  
  devise_for :users, :controllers => { registrations: "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :index, :destroy]

  resources :colleges

  resources :stories do 
    resources :comments
  end
  
  resources :tags

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
