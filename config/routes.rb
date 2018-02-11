Rails.application.routes.draw do
  get :debits, to: 'debits#index', as: :debits
  namespace :debits do
    get :my_debits
    get :my_debits_for_print

    get :confirm_my_debit
    get :request_to_remove_my_debit
    get :confirm_my_group_debit
    get :request_to_remove_my_group_debit

    post :request_debit
    get :cancel_debit_request
    get :confirm_to_remove_debit
  end

  resources :products do
    collection do
      get :filtered
      get :confirmation_operations
    end
  end

  resources :templates
  resources :groups

  root 'panel#index'

  scope '/panel' do
    get :index, to: 'panel#index'
    get :'users/:id', to: 'panel#user'
    get :users, to: 'panel#users'
    get :logs, to: 'panel#logs'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
end
