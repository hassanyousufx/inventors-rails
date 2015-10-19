Rails.application.routes.draw do

  devise_for :ideabooks
  root 'welcome#index'

  resources :ideabooks, only: [:index, :show]
end