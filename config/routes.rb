Rails.application.routes.draw do

  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end


  resources :users, only: [:show, :edit, :update]

end
