Rails.application.routes.draw do
  get '/', to: 'users#index'

  resources :home
  resources :poin_events
  resources :referrals
  resources :events
  resources :event_hists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
