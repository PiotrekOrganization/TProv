Textprovider::Application.routes.draw do
  devise_for :admins
  devise_for :users

  root :to => 'home#index'

  resources :orders
  resources :items
  resources :pages

  match 'p/:slug' => 'pages#show'


  namespace :admin do
    root :to => 'dashboard#index'
    match "customers" => 'admins#customers'
    match "profile" => 'admin#profile'
    match "mail_preferences" => 'admin#mail_settings'
    match "save_mail_preferences" => 'admin#save_mail_settings'
    put "update_password" => 'admin#update_password'
    resources :dashboard
    resources :users
    resources :orders do
      member do
        get 'close'
      end
    end
    resources :admins
    resources :items do
      member do
        get 'confirm'
        get 'conflict'
      end
      collection do
        get 'expired'
        get 'set_expired'
      end
    end
    resources :conflicts
    resources :pages
    match "balance_history" => "balance_history#index"
    post "orders/:id" => "orders#export"
  end


  namespace :writer do

    match "settings" => "writer#settings"
    match "save_mail_settings" => 'writer#save_mailer_settings'
    match "save_new_password" => 'writer#save_new_password'

    resources :items do
      get 'write'
      put 'written'
      get 'close'
      get 'delete'
      get 'refresh'
    end

    resources :payments do
      collection do
        get 'make'
      end
    end

    resources :orders do
      member do
        get 'write'
      end
    end

  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
