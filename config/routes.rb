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

  end

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
  sessions: 'public/sessions'
  }

# scope module: :public do
  namespace :public do
   get "customers/confirmtion" => "customers#confirmtion"
   get "customers/good" => "customers#good"
   patch "customers/withdrawal" => "customers#withdrawal"
   resources :customers, only: [:edit, :show, :update]
   resources :posts
  end



root to:  'public/homes#top'
get '/about' => 'public/homes#about',as:'about'


 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
