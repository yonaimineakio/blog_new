Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
root "static_pages#home"
get "about", to: "static_pages#about"
get 'login', to: 'session#new'
post 'login', to: 'session#create'
delete 'logout', to: 'session#destroy'
resources :posts
resources :comments, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
