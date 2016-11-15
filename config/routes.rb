Rails.application.routes.draw do
    get '/register', to: 'users#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    root 'categories#index'
    resources :users
    resources :categories do
    resources :article, shallow: true
    end

end
