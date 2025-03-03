Rails.application.routes.draw do
    devise_for :users
    root to: "homes#top"

    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
    
    get 'sessions/new'
    get 'registrations/new'
    get 'registrations/create'
    resources :users, :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
