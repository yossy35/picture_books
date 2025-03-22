Rails.application.routes.draw do
  devise_scope :user do
    post "/public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
 
  root to: "homes#top"

  

  get 'users/mypage', to: 'users#mypage'
    

  resources :users, :books
  post 'books' => 'books#create' 

  get '/users/:id/confirm' => 'users#confirm', as: 'confirm'
  patch '/users/:id/quit' => 'users#quit', as: 'quit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
