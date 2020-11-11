Rails.application.routes.draw do
  resources :proparties
  root to:'proparties#index'
end
