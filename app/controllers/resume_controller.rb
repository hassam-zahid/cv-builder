class ResumeController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_profile_availability
  #layout false, only: [:resume]
  def index
  end

  def new
  end

  def destroy_employment_experience
    employment_experience = EmploymentExperience.find_by_global_key(params[:employment_experience_global_key])
    return Notification.notify(false,'Invalid Experience') if(employment_experience.nil? || employment_experience.resume.deleted? || employment_experience.user != current_user )
    employment_experience.destroy
    redirect_to resume_path(:global_key=>employment_experience.resume.global_key)
  end 

  def resume
    (return redirect_to root_path )if (Resume.validate_resume(current_user,params["global_key"])[:status] == false)
    @resume = current_user.resumes.find_by_global_key(params["global_key"])
    @user = current_user
    @completion_ratio = User.completion_ratio(current_user,@resume)
    @job_titles = JobTitle.all.map{|jt| jt.name}
    @companies = Company.all.map{|company| company.name}
    @employment_experiences = @resume.active_employment_experiences.reverse
    @skill_names = @resume.active_skills.map{|s| s.name}.join(",")
    @templates = Template.active_template
  end 

  def resume_info
  end 

  def experience
  end 

  def update_resume_title
     @notify = Resume.update_title(params["global_key"], params["title"])
     respond_to do |format|
         format.js {
         render 'data_submission/profile.js.erb'
        }
      end
  end 
  def skills
  end 

  def interest
  end 

  def education
  end 

  def achievements
  end 

  def certificates
  end 

  def delete_resume
    puts Resume.delete_resume(current_user,params[:resume_global_key])
    redirect_to root_path
  end 

end



