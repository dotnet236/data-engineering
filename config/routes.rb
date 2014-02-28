DataEngineering::Application.routes.draw do
  resources :ledger_imports, only: [:new, :create, :show, :index]

  root to: 'ledger_imports#index'

  devise_for(
    :users,
    controllers: {
      sessions: "sessions",
      omniauth_callbacks: 'omniauth_callbacks',
      sign_in: '/users/auth/google_oauth2',
      sign_up: '/users/auth/google_oauth2'
    })


  devise_scope :user do
    get "/users/sign_in" => 'oauth/google_oauth2#new', via: :get
  end
end
