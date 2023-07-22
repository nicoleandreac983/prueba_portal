Rails.application.routes.draw do
  resources :applications, only: [:index, :show]
  resources :users, only: [:new, :create]
  root to: 'job_offers#index'
  get 'applications/applied_offers'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  resources :job_offers do
    member do
      get :applied_offers
      post :apply 
      get 'applicants', to: 'job_offers#applicants'
    end
  end

# Configura las rutas para la vista de todas las aplicaciones
get 'applications', to: 'applications#index', as: :all_applications

# Configura la ruta para la vista de aplicaciones aplicadas a un trabajo específico
get 'applications/:job_offer_id/applied_offers', to: 'applications#applied_offers', as: :applied_offers



  # Define otras rutas de tu aplicación aquí

end

