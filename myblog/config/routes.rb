Rails.application.routes.draw do
  devise_for :users
  root 'myblog#index'
  get 'myblog' => 'myblog#index'
  get '/new' => 'myblog#new' #投稿画面
  get 'collapsible.html/new' => 'myblog#new' #投稿画面
  post 'myblog' => 'myblog#create' #投稿機能
  #post 'myblog/login' => 'myblog#login' #ログイン画面
  post 'sass.html' => 'myblog#login' #ログイン画面
  delete '/:id' => 'myblog#destroy' #削除画面
  get '/:id/edit' => 'myblog#edit' #編集画面
  patch '/:id' => 'myblog#update' #編集機能
  get 'users/:id' => 'users#show' #マイページ
end

