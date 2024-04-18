Rails.application.routes.draw do

  # 顧客用
  # URL /users/sign_in...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 会員側
  scope module: :public do
    root to: "homes#top"
    get 'searches/search'
    resources :items, only: [:index, :show]
    resources :posts, only: [:new, :index, :show, :update, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      get   "/comfirm"    => :comfirm
      patch "/withdraw"   => :withdraw
    end
  end


  # 管理者用
  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
