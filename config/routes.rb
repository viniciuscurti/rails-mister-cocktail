Rails.application.routes.draw do
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[index new create show]
  end
  resources :doses, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
