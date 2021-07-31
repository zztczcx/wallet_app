Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :wallets do
      member do
        post :deposit
        post :withdraw
        post :transfer
        post :pay
        get  :transactions
      end
    end
  end

  root to: 'users#index'
end
