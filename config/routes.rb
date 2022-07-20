Rails.application.routes.draw do

  namespace :admin do
  resources :genres, only: [:index, :edit, :update, :create]
  resources :customers, only: [:index, :edit, :show, :update]
  resources :posts, only: [:index, :edit, :show, :update]

  end

   scope module: :user do

   end

 # 顧客用
# URL /customers/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
