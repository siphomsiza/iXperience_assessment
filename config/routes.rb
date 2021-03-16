Rails.application.routes.draw do
  resources :users,:except => [:index,:new, :edit, :show, :destroy]
  get '/users/:id/next' => 'users#next' ,:as => :user_next
  get '/users/:id/done' => 'users#done' ,:as => :user_done
  root to: 'users#start'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
