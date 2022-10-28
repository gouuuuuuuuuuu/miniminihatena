Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
  resources :genres, only: [:index, :edit, :update, :create, :destroy]
  resources :customers, only: [:index, :edit, :show, :update, :destroy]
  resources :posts, only: [:index, :edit, :show, :update, :destroy]
  resources :comments, only: [:destroy]
  get "genres/by_customer_index" => "genres#by_customer_index"

  end

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   #registrations: 'customer/registrations',
  sessions: 'public/sessions'
  }

# scope module: :public do
  scope module: :public do
   get "customers/confirmtion" => "customers#confirmtion"
   get "customers/good" => "customers#good"
   get "homes/top" => "homes#top"
   get "searchs/search" => "searchs#search"
   get "genres/by_own_index" => "genres#by_own_index"
   patch "customers/withdrawal" => "customers#withdrawal"
   resources :customers, only: [:edit, :show, :update]
   resources :posts do
    resources :likes, only: [:create, :destroy]
   end
   resources :genres, only: [:create, :index,:destroy]
   resources :comments, only: [:create]
  end

#topページ
root to:  'public/homes#top'

get '/about' => 'public/homes#about',as:'about'

#ゲストログイン
 devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
 end

#ゲストログイン
# devise_for :customer, controllers: {
#    registrations: 'customer/registrations'
#  }

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end