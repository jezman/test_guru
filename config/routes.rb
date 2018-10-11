Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get 'tests/:test_id/questions/:id', to: 'questions#show'
end
