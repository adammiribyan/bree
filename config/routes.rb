Bree::Application.routes.draw do
  resources :templates, :except => :show
  resources :comments
  resources :doctors
  resources :services
  resources :categories  
  resources :teeth_charts
  resources :patients, :shallow => true do
    resources :appointments
  end

  get "teeth_charts/update"
  get "application/autocomplete_patient_full_name"  

  root :to => "categories#index"
end
