Internal::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :attendances do
    get 'search_daily_attendance', :on => :collection
    get 'update_salaat_time', :on => :collection
    get 'six_months_data', :on => :collection
    get 'monthly_report', :on => :collection
    get 'raw_attendance_data', :on => :collection
    get 'hide_name'
    get 'show_name'
    get 'show_hidden_names', :on => :collection
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'attendances#index'
end
