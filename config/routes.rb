Project::Application.routes.draw do
  resources :sessions, only: [:new, :create, :edit, :update, :destroy]
  resources :users
  resources :vacancies
  resources :qualities

  root 'static_pages#_home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/edit',    to: 'users#edit',           via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/vacancies', to: 'vacancies#index',    via: 'get'
  match '/vacancies/new', to: 'vacancies#new',  via: 'get'
  match 'vacancies/edit', to: 'vacancies#edit',  via: 'get'
  match '/users',       to: 'users#index',      via: 'get'

  get "users/new"
  get "users/index"
  get "static_pages/_home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/Contact"
  get "users/edit"
  get "vacancies/index"
  get "vacancies/edit"
  get "vacancies/new"
  
  

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
