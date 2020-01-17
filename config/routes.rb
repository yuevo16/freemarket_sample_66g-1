Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  # devise_scope :user do
  #   get 'addresses', to: 'users/registrations#new_register'
  #   post 'addresses', to: 'users/registrations#create_register'
  # end
  root 'post#index'
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'step6'
      get 'done'
    end
  end
  
  root 'mypage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
