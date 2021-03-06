Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/create'

  get 'orders/destroy'

  get 'orders/quote'



  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }



  resources :products do

    resources :orders, only: :create do
      collection do
        post 'session_quote'
      end
    end

    collection { post :import }

    resources :photos, only: [:create, :destroy]

    member do
      get 'download_ficha'
      get 'download_autocad'
    end
  end

  resources :orders, only: [:index, :destroy] do
    member do
      post 'update_quiantity'
    end
  end

  resources :catalogos, only: [:create, :update] do
    collection do
      get 'download_catalogo'
    end
  end

  get 'pages/index'

  get 'pages/catalogue'

  get 'pages/about'

  get 'pages/contact'

  post 'pages/message'

  get 'admin/dashboard'

  get 'admin/catalogo'

  get 'admin/import'

  get 'pages/mh3'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
