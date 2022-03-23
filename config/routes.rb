Rails.application.routes.draw do
  get 'myhistory/index'
  get 'myhistory/points_leaderboard'
  root to: 'home#index'
  get '/home/adminDash' => "home#adminDash", :as => :admin_root
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: "users/sessions" }
    devise_scope :user do
      get 'users/edit', to: 'users/sessions#edit', as: :edit_user_session
      post 'users/edit', to: 'users/sessions#update'
      get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
      get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :home
  resources :poin_events
  resources :referrals
  resources :events
  resources :event_hists
  resources :users
  resources :sessions
  resources :signups #plural???
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
