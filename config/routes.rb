Rails.application.routes.draw do

  #管理者ログイン　URL /admin/sign=in...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  get 'admin' => 'admin/homes#top'

  #管理者
  namespace :admin do
    resources :posts, only: [:show, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :index]

  end

  #ユーザーログイン URL /users/sign_in....
  devise_for :user,controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'

  }

  #ゲストユーザーログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  #ユーザー
  scope module: :user do
    resources :posts, only: [:index, :show, :new, :create, :edit]
  end

  root to: 'user/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
