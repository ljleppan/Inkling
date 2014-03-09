Rubylab::Application.routes.draw do



  root  'static#index'

  get 'about', to:'static#about'

  get 'contact', to:'static#contact'

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  resources :sessions, :only => [:new, :create, :destroy]

  resources :exercises
  get 'update_exams', to: 'exercises#update_exams'
  post 'add_exercise_to_exam', to: 'exercises#add_to_exam'

  resources :exams

  resources :courses

  resources :users

end
