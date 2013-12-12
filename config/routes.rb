Book::Application.routes.draw do
  get "administrators/show"
  get "pictures/index"
  get "activities/index"
  get "klasses/show"

  root 'sessions#new'
  resources :users, only: [:show] do
    resource :klass, only: [:show]
  end
  resources :klasses, only: [] do
    resources :activities, only: [:index]
  end
  resources :activities, only: [] do
    resources :pictures, only: [:index]
  end
  resources :klasses, only: [] do
    resources :students, only: [:index]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures, only: [:create]

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'get'

  # 学生的图片（按活动分类）
  match '/students/:student_id/pictures', to: 'students#pictures', via: 'get', as: 'students_pictures'

  match '/upload', to: 'pictures#upload', via: 'post'
  match '/move_to_activity', to: 'pictures#move_to_activity', via: 'post'
  match '/copy_to_activity', to: 'pictures#copy_to_activity', via: 'post'
  match '/remove_from_current_activity', to: 'pictures#remove_from_current_activity', via: 'post'
  match '/assign_to_students', to: 'pictures#assign_to_students', via: 'post'

  #flash 界面的接口
  # front
  match '/front/pictures', to: 'flex#front_pictures', via: 'get'
  match '/front/template', to: 'flex#front_template', via: 'get'
  match '/front/template', to: 'flex#save_front_template', via: 'post'
  # back
  match '/back/template', to: 'flex#back_template', via: 'get'
  match '/back/template', to: 'flex#save_back_template', via: 'post'


  namespace :admin do
    get '', to: 'sessions#new', as: '/'
    resources :sessions, only: [:new, :create, :destroy]
    resources :administrators, only: [:show]
    get '/signin', to: 'sessions#new'
    get '/signout', to: 'sessions#destroy'
    get '/dashboard', to: 'dashboard#index'
    get '/teachers', to: 'teachers#index'
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
