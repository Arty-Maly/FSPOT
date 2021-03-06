Mvp::Application.routes.draw do
  get "notifications/index"
  resources :likes

  resources :uploads

  resources :users
  
  get "upload/index" => 'uploads#index'
  
  # get '/' => 'home#index'
  get "/" => "sessions#new", as: :root
  post "/" => "sessions#create", as: :log_in
  get "/log-out" => "sessions#destroy", as: :log_out

  get "/sign-up" => "users#new"
  post "/sign-up" => "users#create", as: :sign_up

  get "/main" => "main_page#index", as: :main

  # get "/main/map_search" => "main_page#search_handler", as: :query_search

  get "/find-friends" => "friends#find_friend_handler", as: :find_friend
  get "/follow-friends" => "friends#follow_friend_handler", as: :follow_friend

  get "/friends" => "friends#index"

  post "/friends" => "friends#follow"

  get "/maps" => "maps#index", as: :geo

  get "/uploads/new" => "uploads#new"

  get "/upload_location" => "sessions#location_handler", as: :location

  get "/upload_address" => "sessions#address_handler", as: :address

  get "/map_search" => "maps#maps_search_handler", as: :map_search

  # post "/comment" => "comment#create"

  get "/comment/new" => "comment#create", as: :new_comment

  get "/personal" => "personal#index", as: :personal

  get "/notifications" => "notifications#index", as: :notifications




   # post "dislike" => "likes#destroy"
  # post "/like" => "likes#create"

  get "/like" => "likes#create", as: :like_count

  get "/personal/:id" => "personal#index"

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'main_page#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
