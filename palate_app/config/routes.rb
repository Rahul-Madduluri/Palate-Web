PalateApp::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers, :omniauth
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :palate_recommendations, only: :create
  resources :relationships, only: [:create, :destroy]
  resources :user_songs, only: [:create, :update]

  resources :movies do
  end

  resources :artists do
  end

  root  'static_pages#home'
  match '/signup', to: 'users#new',    via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout',to: 'sessions#destroy', via: 'delete'

  #omniauth
  get 'auth/:provider/callback' => 'users#omniauth', as: 'omniauth'
  #match 'auth/:provider/callback', to: 'users#omniauth', via: 'post'
  match 'auth/failure', to: redirect('/'), via: 'get'

  #static pages
  patch '/update_movie_attr' => 'static_pages#update_movie_attr'
  get '/questionnaire' => 'static_pages#firstbite', as: 'firstbite'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
