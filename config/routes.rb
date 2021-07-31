Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'about', to:'pages#about'
  resources :students, except: [:destroy]
  get 'logins', to: 'logins#new'
  post 'logins', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
end
