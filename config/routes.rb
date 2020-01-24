Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  root 'post#index'

  resources :items do
  end
  
  resources :sell do
    resources :purchase do
      collection do
        get 'show'
      end
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
    end
  end


  resources :mypage do
    member  do
      get 'index'
      get 'identification'
      get 'credit_card'
      get 'user_profile'
      get 'logout'
      get 'item_detail'
      get 'edit'
      get 'sell_list'
    end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
