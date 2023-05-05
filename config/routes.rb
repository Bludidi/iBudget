Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'users#home', as: :unauthenticated_root
    end
  end

  resources :categories, only: %i[index new create] do
    resources :items, only: %i[index new create] do
      resources :item_categories, only: %i[create]
    end
  end
end
