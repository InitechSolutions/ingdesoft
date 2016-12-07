Rails.application.routes.draw do
  resources :visits do
  collection do
    get :fechas
  end
end
  resources :compras do
  collection do
    get :fechas
  end
  end
  resources :answers
  resources :comentarios
  resources :favors do
    collection do
      get :eliminar
      get :buscar
      get :lugar
      get :titulo_descripcion
      get :reabrir
    end
  end
  resources :logros
  resources :estadisticas do
    collection do
      get :visitas
      get :ganancias
      get :favores_resueltos
    end
  end
  resources :precios
  resources :postulations do
    collection do
      get :elegir
      get :positivo
      get :fechas
    end
  end
  devise_for :users do
  end
  resources :users, only: [:show]
  resources :users, path: "show" do
    collection do
      get :buscar_logro
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'favors#index'
get  'about'    => 'clean_blogs#about'
get  'post'     => 'clean_blogs#post'
get  'contact'  => 'clean_blogs#contact'
get  'postulation/:id/calificar' , to: 'postulations#calificar', :as => :calificar
end
