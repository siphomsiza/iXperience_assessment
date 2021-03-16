Rails.application.routes.draw do
  resources :users,:only => [:next,:done, :start, :create, :update] do
    member do
      get 'next'
      get 'done'
    end
  end
  root to: 'users#start'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
