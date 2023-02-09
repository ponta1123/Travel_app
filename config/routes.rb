Rails.application.routes.draw do

  #管理者　URL /admin/sign=in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  #ユーザー URL /users/sign_in....
  devise_for :user,controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'

  }

  # post "guest_login", to: "guest_sessions#create"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  scope module: :user do
  end

  root to: 'user/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
