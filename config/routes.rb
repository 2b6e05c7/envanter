Rails.application.routes.draw do

  resources :products
  resources :templates
  resources :groups
  root 'panel#index'

  scope '/panel' do
    get 'index', to: 'panel#index'
    get 'users', to: 'panel#users'
    get 'debits', to: 'panel#debits'
    get 'logs', to: 'panel#logs'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

end
