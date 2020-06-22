Rails.application.routes.draw do
  # root 'static_pages#home'
  root 'static_pages#home', as: 'home'
  get 'help' => 'static_pages#help', as: 'help'
  get 'about' => 'static_pages#about', as: 'about'
  get 'contact' => 'static_pages#contact', as: 'contact'
  get 'signup' => 'users#new', as: 'signup'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: %i[edit]
  resources :password_resets, only: %i[new create edit update]
  resources :miniposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
