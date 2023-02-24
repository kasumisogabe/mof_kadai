Rails.application.routes.draw do
  root to: 'properties#index'
  resources :properties do
    collection do
      post :confirm
    end
  end
end
