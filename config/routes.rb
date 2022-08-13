Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  root "splash#index"

  resources :users, only: [:index] do
    resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  resources :splash, only: [:index]
end
