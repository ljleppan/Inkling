Rubylab::Application.routes.draw do

  resources :users

  root  'static#index'

  get 'about', to:'static#about'

  get 'contact', to:'static#contact'

  resources :exercises

  resources :exams

  resources :courses

end
