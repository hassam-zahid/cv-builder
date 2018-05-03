class Resume < ApplicationRecord
  belongs_to :profile
  has_many :employment_experiences, dependent: :destroy
  has_many :achievemenst, dependent: :destroy
  has_many :resumes_skills
  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :certificates, dependent: :destroy
  has_and_belongs_to_many :degrees, dependent: :destroy
  has_and_belongs_to_many :skills, dependent: :destroy
  

  def create_resume(params = {})
  	  user 		 = User.find(self.id)
  	  title 	 = params[:title] || "resume_#{(user.profile.resumes.count+1)}"
  	  experience = params[:experience] || nil 
  	  image_id   = params[:image_id]
  end 

  def resume_skills
    ResumesSkill.where(:resume_id => self.id)
  end 

  def active_skills
    self.resume_skills.where(:is_active => true).map{|s| Skill.find(s.skill_id)}
  end 

  def user
      Resume.find(self.id).profile.user 
  end 

  def deleted?
    (self.is_active == false) ? true : false 
  end 

  def destroy
    self.update(:is_active => false) 
  end 

  def self.update_resume(params ={})
  end 

  def self.update_title(global_key, title)
    resume = Resume.find_by_global_key(global_key)
    return Notification.notify(false, I18n.t("generic.some_thing_went_wrong")) if resume.nil?
    return Notification.notify(true, I18n.t("resume.title_is_updated")) if resume.update(:title => title)
    return Notification.notify(false, I18n.t("generic.some_thing_went_wrong")) #incase nothing happen
  end 

  def self.validate_resume(user,global_key)
    (user.resumes.map{|r| r.global_key}.include? global_key) ? (return Notification.notify(true, I18n.t("generic.valid_request"))) : (return Notification.notify(false, I18n.t("resume.invalid_resume_request")))
  end

  def self.create_resume_by_title(params)
    user = params[:user]
    (user.profile.resumes.create(:title => params[:title], :global_key => Api.global_key)) ? (return Notification.notify(true, "Resume is succefully created")) : (return Notification.notify(false, I18n.t("generic.some_thing_went_wrong")))
  end

  def self.allowed_resume_check(user)
    return true if user.resumes.count < user.allowed_resume 
    return false
  end

  def self.delete_resume(user,resume_global_key)
    resume = user.resumes.find_by_global_key(resume_global_key)
    return Notification.notify(false,I18n.t("resume.invalid_resume_request")) if (resume.nil? || resume.is_active == false)
    resume.update(:is_active => false )
    return Notification.notify(true, I18n.t("resume.resume_deleted"))
  end 

  def active_employment_experiences
    self.employment_experiences.where(:is_active => true)
  end 

  def active_resumes_skills
    ResumesSkill.where(:is_active => true, :resume_id => self.id)
  end 

end



	  