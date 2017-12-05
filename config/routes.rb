Rails.application.routes.draw do
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:create]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resources :recommends, only: [:create]
  end

  resources :restaurants do
    collection do
      get 'search'
      get 'register'
    end
  end
end
