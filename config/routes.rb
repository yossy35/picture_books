Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
 
  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get 'homes/about', to: 'homes#about', as: :about
    


    resources :users
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  get 'users/mypage', to: 'users#mypage'
    
  get 'sessions/new'
  get 'registrations/new'
  get 'registrations/create'
  resources :books
  post 'books' => 'books#create' 

  get '/users/:id/confirm' => 'users#confirm', as: 'confirm'
  patch '/users/:id/quit' => 'users#quit', as: 'quit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
