Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy]
    end
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  namespace :admin do
    resources :users, only: :index
  end

  resources :sessions, only: [:new, :create] do

    delete :destroy, on: :collection
  end
  resources :users, only: [:new, :create] do
    get 'liked_items', to: 'items#index'
  end

  resources :items do
    resources :likes, only: [:create, :destroy]
    resources :biddrs, only: [:create, :destroy]
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :biddrs, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  get('/contact', { to: 'welcome#contact' })

  post('/contact_submit', { to: 'welcome#submit' })

  get '/', to: 'welcome#index', as: 'home'

end
