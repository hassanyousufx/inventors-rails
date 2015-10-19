Rails.application.routes.draw do

  devise_for :ideabooks

  resources :ideabooks, only: [:index, :show] do
  	resources :ideas
  end

  authenticated :ideabook do
  	root 'ideabooks#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end