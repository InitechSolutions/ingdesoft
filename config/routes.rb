Rails.application.routes.draw do
  resources :precios
  devise_for :users
  resources :users, only: [:show]
  resources :compras
  resources :precios
  resources :favors do
    collection do
      get :lugar
      get :titulo_descripcion
    end
  end
  resources :logros
  resources :postulations do
    collection do
      get :elegir
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'favors#index'
get  'about'    => 'clean_blogs#about'
get  'post'     => 'clean_blogs#post'
get  'contact'  => 'clean_blogs#contact'

end
