Rails.application.routes.draw do
  root to: 'home#index'
  
  controller :static_pages do
    get 'about_game',     to: :about_game
    get 'about_company',  to: :about_company
    get 'contacts',       to: :contacts
    get 'offer',          to: :offer
    get 'protection',     to: :protection
    get 'security',       to: :security
    get 'user_agreement', to: :user_agreement
  end

  #get 'about_game'     =>     'about_game#index'
  #get 'security'       =>       'security#index'
  #get 'protection'     =>     'protection#index'
  #get 'offer'          =>          'offer#index'
  #get 'user_agreement' => 'user_agreement#index'
  #get 'about_company'  =>  'about_company#index'
  #get 'contacts'       =>       'contacts#index'

  resources :posts

  controller :yandex_moneys do
    post 'yandex_moneys/check_order'  => :check_order
    post 'yandex_moneys/payment_done' => :payment_done
  end
  
  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

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
