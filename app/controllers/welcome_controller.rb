class WelcomeController < ApplicationController
  before_action :authenticate_user!, :except => [:landing_page]
  before_action :validate_user_profile_availability, :except => [:landing_page, :profile]
  #before_action :validate_super_admin, :only => [:deploy]
  layout false, only: [:landing_page]
  def landing_page
    redirect_to home_path if user_signed_in? 
  end 

  def index
  	@resumes = current_user.resumes
    @resume_creation_flag = Resume.allowed_resume_check(current_user)


  end

  def deploy 
    system('git pull')
    system('bundle install')
    system('bundle exec rake db:migrate RAILS_ENV=production')
    system('bundle exec rake db:seed RAILS_ENV=production')
    system('RAILS_ENV=production bundle exec rake assets:precompile')
    system('sudo service nginx restart')
    redirect_to root_path
  end 

  def profile 
    @languages = MasterLookup.languages.map{|language| {:id => language.id, :name => language.value}}
    @user_language_id  = current_user.language.id
    @user = current_user
    @categories = Category.active_categories.map{|cat| {:name => cat.name}}
  end 
  
  def about_us 
  end 

  def service 
  end 

  def plans
  end 
  
end
