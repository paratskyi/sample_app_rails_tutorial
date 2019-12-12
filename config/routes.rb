Rails.application.routes.draw do
  get 'users/new'
  # root 'static_pages#home'
  root 'static_pages#home', as: 'home'
  get 'help' => 'static_pages#help', as: 'help'
  get 'about' => 'static_pages#about', as: 'about'
  get 'contact' => 'static_pages#contact', as: 'contact'
  get 'signup' => 'users#new', as: 'signup'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
