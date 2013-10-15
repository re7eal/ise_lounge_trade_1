BootstrapDeviseCancan::Application.routes.draw do
  resources :wants

  resources :haves

  resources :trade_messages

  resources :trades

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end