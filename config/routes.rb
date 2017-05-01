Rails.application.routes.draw do


  concern :votable do
    member do
      post :upvote, :downvote
    end
  end

  resources :paragraphs, concerns: :votable

  resources :documents do
    member do
      post :unlock
    end
    resources :sections, shallow: true do
      resources :paragraphs, shallow: true
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"
end
