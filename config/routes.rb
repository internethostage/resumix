Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  resources :snippets
  resources :accomplishments, controller: 'snippets', type: 'Accomplishment'
  resources :details,         controller: 'snippets', type: 'Detail'
  resources :educations,      controller: 'snippets', type: 'Education'
  resources :endorsements,    controller: 'snippets', type: 'Endorsement'
  resources :experiences,     controller: 'snippets', type: 'Experience'
  resources :interests,       controller: 'snippets', type: 'Interest'
  resources :languages,       controller: 'snippets', type: 'Language'
  resources :others,          controller: 'snippets', type: 'Other'
  resources :skills,          controller: 'snippets', type: 'Skill'
  resources :summaries,       controller: 'snippets', type: 'Summary'



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
