Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'

  resources :cocktails, only: [:show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
end
