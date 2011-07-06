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
    resources :appointments
  end
  
  match 'login' => 'sessions#new', as: 'sign_in'
  match 'logout' => 'sessions#destroy', as: 'sign_out', :via => :delete

  get "teeth_charts/update"
  get "application/autocomplete_patient_full_name"

  root :to => "categories#index"
end
