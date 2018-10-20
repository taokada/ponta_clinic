Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'home/index'
  get 'home/top'

  get 'articles/show'

  resources :articles do
    resources :comments
  end

  resources :likes, only: [:create, :destroy]



  post "articles/:article_id/comments/:id/update" =>"comments#update"
  post "articles/:article_id/comments/:id" => "comments#destroy"
  root to: 'home#index'

  get 'bookmarks/:article_id/toggle' => "bookmarks#toggle"
  get 'bookmarks/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
