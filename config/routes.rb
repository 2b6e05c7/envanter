Rails.application.routes.draw do
  resources :products do
    member do
      post :debit_to_group
      post :debit_to_user
    end
  end

  resources :templates
  resources :groups
  root 'panel#index'

  scope '/panel' do
    get :index, to: 'panel#index'
    get :my_debits, to: 'panel#my_debits'
    get :'users/:id', to: 'panel#user'
    get :users, to: 'panel#users'
    get :debits, to: 'panel#debits'
    get :logs, to: 'panel#logs'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
end
