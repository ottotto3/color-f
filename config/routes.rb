Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admins
  
  # 会員側
  scope module: :public do
    root to: "homes#top"
    get 'searches/search'
    resources :items, only: [:index, :show]
    resources :posts, only: [:new, :index, :show, :update, :create, :destroy]
    resources :users, only: [:show, :edit, :update] do
      get   "/comfirm"    => :comfirm
      patch "/withdraw"   => :withdraw
    end
    resources :comments, only: [:create, :destroy]
  end
  
  
  # 管理者用
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
