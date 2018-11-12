Rails.application.routes.draw do
  
  resources :tests do
    resources :questions, shallow: true
  end

  get 'add_question', to: 'questions#new'
  post 'add_question', to: 'questions#create'
end
