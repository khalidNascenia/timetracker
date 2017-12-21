Internal::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :approval_chains do
    member { post :assign }
    collection { post :create_chain }
    member do
      get :remove
    end
  end

  resources :leave_tracker

  resources :users do
    member do
      get :leave
      get :team
    end

    collection do
      get :download
    end
  end

  # leaves_controller resources generate paths with 'leafe' as singular for 'leaves'
  # That is why we defined plural and singular for leave in config/initializers/inflections.rb
  resources :leaves do
    member { post :approve, :reject}
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update, :destroy]

  resources :attendances do
    collection do
      get :monthly_summary
      get :download
    end
  end

  resources :salaats

  resources :weekends do
    member do
      post :assign
      get :remove
      get :detail
    end

    resources :exclusion_dates, except: :index
  end

  resources :holiday_schemes do
    member do
      get :assign_form
      get :remove
      post :assign
    end

    resources :exclusion_dates, except: :index
  end

  resources :holidays

  resources :super_admin_leaves, only: :index do
    member { patch :change_type }
  end

  root :to => 'dashboard#index'
end
