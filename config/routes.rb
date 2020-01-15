Rails.application.routes.draw do
  devise_for :cards
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    # 下のaddressesはテーブル名？
    get 'addresses', to: 'users/registrations#new_register'
    post 'addresses', to: 'users/registrations#create_register'
  end
  root 'post#index'
  # resources :users, only: :show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
