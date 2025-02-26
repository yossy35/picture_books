Rails.application.routes.draw do
  get 'registrations/new'
  get 'registrations/create'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
