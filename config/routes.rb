Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books
  resources :users
  get 'top' => 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
