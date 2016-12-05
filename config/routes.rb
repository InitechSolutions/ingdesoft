Rails.application.routes.draw do
  resources :compras
  resources :favors do
    collection do
      get :eliminar
      get :lugar
      get :titulo_descripcion
    end
  end
  resources :logros
  resources :precios
  resources :postulations do
    collection do
      get :elegir
      get :calificar
    end
  end
  devise_for :users do
  end
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'favors#index'
get  'about'    => 'clean_blogs#about'
get  'post'     => 'clean_blogs#post'
get  'contact'  => 'clean_blogs#contact'
end
