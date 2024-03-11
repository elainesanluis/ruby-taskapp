Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :categories do
    resources :taskapps do
      member do
        patch 'complete', to: 'taskapps#complete', as: 'complete'
      end
    end
    get 'show_joined_table', to: 'categories#alltasks', on: :collection
  end
 
  resources :taskapps do
    collection do
      get 'due', to: 'taskapps#due', as: :due_tasks
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories

end
