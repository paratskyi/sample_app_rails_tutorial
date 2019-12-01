Rails.application.routes.draw do
  # root 'static_pages#home'
  root 'static_pages#home', as: 'static_pages_home'
  get 'static_pages/help', as: 'static_pages_help'
  get 'static_pages/about', as: 'static_pages_about'
  get 'static_pages/contact', as: 'static_pages_contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
