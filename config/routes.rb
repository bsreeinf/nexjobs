Rails.application.routes.draw do
  
  get 'landing_page/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'landing_page#index'

  get    'login'                        => 'sessions#new'
  get    'login_device'                 => 'sessions#mobile_login'
  get    'signup'                       => 'companies#new'
  get    'login'                        => 'sessions#new'
  post   'login'                        => 'sessions#create'
  delete 'logout'                       => 'sessions#destroy'
  get    'applications'                 => 'jobs#applications'

  get    'saved_applied_jobs'           => 'jobs#saved_applied_jobs'
  post   'save_apply_job'                    => 'jobs#save_apply_job'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :users
  resources :companies
  resources :init
  resources :jobs

  get 'edit_questionnaires' => 'questionnaires#edit_questionnaires'
  resources :questionnaires
  resources :questionnaire_options


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
