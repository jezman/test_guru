Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
