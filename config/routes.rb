Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  devise_scope :user do
    get 'users/edit', to: 'users/sessions#edit', as: :edit_user_session
    patch 'users/edit', to: 'users/sessions#update'
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session

    get 'officers/approval_list', to:'referrals#admin', as: :admin_approve
    get 'officers' => 'home#adminDash', :as => :admin_root
    get 'officers/help'=> 'home#adminhelp', :as => :home_adminhelp
    get 'users/help'=>'home#userhelp', :as => :home_userhelp
    get 'info'=>'home#info', :as => :home_info
    get 'myhistory/index'

    post 'users/dev/:id' => 'users#dev', :as => 'dev'
    post 'users/nodev/:id' => 'users#nodev', :as => 'nodev'
    post '/create_new_admin', to: 'users#create_new_admin'
    post '/sign_in_event', to: 'events#sign_in_event'
    # 

    get 'leaderboard'=>'myhistory#points_leaderboard', :as =>:myhistory_points_leaderboard
    get 'leaderboard'=>'myhistory#points_leaderboard2', :as =>:myhistory_points_leaderboard2

    # get 'point_history' => 'poin_events#index', :as => :poin_events
    # post 'point_history' => 'poin_events#index', :as => :poin_events
    resources :poin_events, :path=> :point_history
    # post '/points_policy', to: 'points#create'
    post '/reset_semester', to: 'poin_events#reset'
    post '/remove_member', to: 'users#remove_member'
    # end
    
  end

  resources :home
  # resources :poin_events
  resources :referrals
  resources :events
  resources :categories
  resources :points
  resources :event_hists
  resources :users
  resources :sessions
  resources :signups # plural???
  resources :helps
  resources :announcements
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end