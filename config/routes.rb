Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result

    end
  end
end
