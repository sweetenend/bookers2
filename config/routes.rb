Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
   get "home/about" => "homes#about", as: 'about'

  resources :books, only:[:new, :index, :show, :edit, :create, :destroy, :update]
  resources :users, only:[:edit, :index, :show, :update]
  # For detai resources :users, only:[:show, :edit, :index]ls on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
