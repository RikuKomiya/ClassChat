Rails.application.routes.draw do
  
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: {sessions: 'sessions'}
    resources :examples
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
