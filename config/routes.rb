Project::Application.routes.draw do
  resources :sessions, only: [:new, :create, :edit, :update, :destroy]
  resources :users do
    get 'download_cv', on: :member
    get 'image', on: :member
  end
  resources :vacancies do
    get 'apply_to_vacancy', on: :member
  end
  resources :qualities
  resources :news
  
  get "pages/index"
  
  resources :pages

  root 'pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/edit',    to: 'users#edit',           via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/vacancies', to: 'vacancies#index',    via: 'get'
  match '/vacancies/destroy', to: 'vacancies#destroy', via: 'get'
  match '/vacancies/new', to: 'vacancies#new',  via: 'get'
  match '/vacancies/edit', to: 'vacancies#edit',  via: 'get'
  match '/users',       to: 'users#index',      via: 'get'
  match '/applications', to: 'users#applications',  via: 'get'
  match '/admin/stats', to: 'admin#stats', via: 'get'
  match '/admin/pages', to: 'admin#pages', via: 'get'
  match '/admin/replies', to: 'admin#replies', via: 'get'
  match '/admin/vacancies', to: 'admin#vacancies', via: 'get'
  match '/admin/users', to: 'admin#users', via: 'get'
  match '/admin/qualities', to: 'admin#qualities', via: 'get'
  match '/faq', to: 'pages#faq', via: 'get'
  match '/terms', to: 'pages#terms', via: 'get'
  match '/company', to: 'pages#company', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'

  get "users/new"
  get "users/index"
  get "pages/home"
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
