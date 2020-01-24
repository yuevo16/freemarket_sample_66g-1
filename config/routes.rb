Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  root 'post#index'


  resources :items, only: [:index,:new, :create]


    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end

  

    resources :card , only: [:new, :show] do
      collection do
        post 'pay', to: 'card#pay'
        post 'delete', to: 'card#delete'
      end
    end


  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'step6'
      get 'done'
      post 'pay'
    end
  end

  resources :mypage do
    collection  do
      get 'index'
      get 'identification'
      get 'credit_card'
      get 'user_profile'
      get 'logout'
      get 'item_detail'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
