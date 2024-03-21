Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :categories do
    resources :taskapps do
    end
    get 'show_joined_table', to: 'categories#alltasks', on: :collection
  end

end
