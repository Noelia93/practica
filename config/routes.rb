Rails.application.routes.draw do

  get 'users/new'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :subjects
  resources :teachers
  resources :courses
  resources :departments

  get 'signup', to: 'users#new'
  resources :users, except: [:new]  #ya que new lo he usado en la linea de arriba

  #Ahora, para que localhost:3000/login tenga una ruta, se la creo. Esto es:
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #donde recuerdo, sessions es la parte de controler y new es la action que va a hacer.


end
