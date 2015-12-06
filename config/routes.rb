Rails.application.routes.draw do
  devise_for :users
  root :to => "visitors#index"

  get '/tuitions', to: 'tuitions#index'
  
  resources :students do
    get :subjects
  end
  
  resources :teachers
  get '/teachers/:id/subjects', to: 'teachers#subjects', as: 'teacher_subjects'
  get '/reports/subjects' ,to: 'reports#subjects', as: 'report_subjects'
  
end
