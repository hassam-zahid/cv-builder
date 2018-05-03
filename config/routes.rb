Rails.application.routes.draw do
  get 'resume/index'

  get 'resume' => 'resume#resume'
  get 'delete_resume' => 'resume#delete_resume'
  get 'destroy_employment_experience' => 'resume#destroy_employment_experience'
  get 'log/error_log'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#landing_page'
  
  get 'home' => 'welcome#index'
  get 'profile' => 'welcome#profile'
  get 'deploy' => 'welcome#deploy'
  
  get 'report/index'

  get 'support/index'

  get 'template/index'
  get 'template/landser'
  get 'resume_data' => 'api#resume_data'

  get 'account/index'

  get 'admin/index'
  get 'admin/users'
  get 'admin/templates'
  post 'admin/add_template'
  get 'admin/delete_template'
  get 'show_template' => 'template#show_template'
  get 'ui_resume_template' => 'template#ui_resume_template'
  
  get 'update_language' => 'data_submission#update_language'


  post 'update_resume_title' => 'resume#update_resume_title'
  post 'create_user' => 'data_submission#create_user'
  post 'profile' => 'data_submission#profile'
  post 'update_category' => 'data_submission#update_category'
  post 'login' => 'data_submission#login'
  post 'resume_info' => 'resume#resume_info'
  post 'experience' => 'resume#experience'
  post 'skills' => 'resume#skills'
  post 'interest' => 'resume#interest'
  post 'education' => 'resume#education'
  post 'achievements' => 'resume#achievements'
  post 'certificates' => 'resume#certificates' 
  post 'create_resume' => 'data_submission#create_resume'
  post 'create_employment_experience' => 'data_submission#create_employment_experience' 
  post 'update_employment_experience' => 'data_submission#update_employment_experience' 
  post 'update_professional_skills' => 'data_submission#update_professional_skills'
end
