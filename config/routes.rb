Rails.application.routes.draw do
  resources :compras
  resources :favors do
  	collection do
  		get :lugar
  		get :titulo_descripcion
  	end
  end
  resources :logros
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'favors#index'
get  'about'    => 'clean_blogs#about'
get  'post'     => 'clean_blogs#post'
get  'contact'  => 'clean_blogs#contact'

end
