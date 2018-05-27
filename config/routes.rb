TechReviewSite::Application.routes.draw do
  devise_for :users
  # 2018/05/04 DEL(S) HFUJIYOS
  # get 'products/:product_id/reviews/new' => 'reviews#new'
  # post 'products/:product_id/reviews' => 'reviews#create'
  # resources :reviews, only: [:new, :create]
  # 2018/05/04 DEL(E) HFUJIYOS
  
  # 2018/05/05 ADD(S) HFUJIYOS
  resources :users, only: :show
  # 2018/05/05 ADD(E) HFUJIYOS
  resources :products, only: :show do
    # 2018/05/04 ADD(S) HFUJIYOS
    resources :reviews, only: [:new, :create]
    # 2018/05/04 ADD(E) HFUJIYOS
    collection do
      get 'search'
    end
  end
  root 'products#index'

end
