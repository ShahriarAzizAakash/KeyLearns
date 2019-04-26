Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #post '/login' => "sessions#create"
  #delete '/logout' => "sessions#destroy"
  post 'refresh', controller: :refresh, action: :create
  post 'login', controller: :signin, action: :create
  post 'register', controller: :signup, action: :create
  delete 'logout', controller: :signin, action: :destroy
 
  #post '/register' => "users#create"
  get '/profile' => "users#profile"

  post '/content' => "content#create"

  get '/search' => "courses#search"


  resources :enrollments
  resources :courses
end
