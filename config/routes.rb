Bree::Application.routes.draw do
  resource  :session, controller: 'sessions', only: [:new, :create, :destroy]
  resources :reminders, :only => :index
  resources :line_items
  resources :templates, :except => :show
  resources :comments
  resources :doctors
  resources :services
  resources :categories
  resources :teeth_charts
  resources :patients, :shallow => true do
    resources :appointments do
      match 'print', as: "print", :on => :member, 
    end
  end
  
  match 'login' => 'sessions#new', as: 'sign_in'
  match 'logout' => 'sessions#destroy', as: 'sign_out', :via => :delete
  match 'reset_password' => 'sessions#reset_password', as: 'reset_password'

  get "teeth_charts/update"
  get "application/autocomplete_patient_full_name"
  
  get "statistics/(:range)" => "statistics#index", as: "statistics"
  
  root :to => "categories#index"
end
