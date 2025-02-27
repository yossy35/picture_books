Rails.application.routes.draw do
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'users/mypage'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/confirm'
  get 'sessions/new'
  get 'registrations/new'
  get 'registrations/create'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
