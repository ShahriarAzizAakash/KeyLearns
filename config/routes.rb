Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
 
  post '/register' => "users#create"
  get '/profile' => "users#profile"


  resources :enrollments
  resources :courses
end
