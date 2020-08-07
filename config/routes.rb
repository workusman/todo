Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :lists do
      resources :tasks
      get "/filtered_tasks", to: "tasks#filtered_tasks"
    end
  root to: "lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
