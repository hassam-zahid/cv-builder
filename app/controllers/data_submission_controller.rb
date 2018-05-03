class DataSubmissionController < ApplicationController
	after_action :save_user_location, :only => [:create_user, :login]
	before_action :authenticate_user!, :except => [:create_user, :login, :update_language]
	def create_user
		res = User.new_user_validation_and_creation(params[:email], params[:password], params[:confirm_password],:user_ip => user_ip,:via => 'manual')
		if res[:status] == true
			sign_in user = User.find_by_email(params[:email])
			UserLog.create_log(user, 'Signed Up')
			user_login_redirection(user)
		else
			flash[:alert] = res[:message]
			redirect_to root_path  
		end 
	end 

	def login
		via =  params[:via] || 'manual'
		res = User.login(params[:email],:password => params[:password], :ip_address => user_ip, :via => via)
		if res[:status] == true
			sign_in user = User.find_by_email(params[:email])
			UserLog.create_log(user, 'Loging in')
			user_login_redirection(user) 
		else
			#@notify  = Notification.notify(false,t("session.invalid_credentials"))
			flash[:alert] = t("session.invalid_credentials")
			redirect_to root_path 
		end  
	end 

	def profile
		@notify = Profile.profile_after_signup(current_user,params)
		render formats: :js
	end 

	def update_category
		@notify = User.update_category(current_user,params[:name])
		respond_to do |format|
	       format.js {
    	   render 'data_submission/profile.js.erb'
    		}
    	end
	end 

	def update_language
		language_id = params[:id] || MasterLookup.languages.find_by_key('english').id
		Language.update_user_language(current_user,language_id) if user_signed_in?
		language_code = MasterLookup.languages.find_by_id(language_id).code || 'en'
		set_specific_language(language_code)
		redirect_back fallback_location: root_path
	end

	def create_resume

	    @notify = Resume.create_resume_by_title(params.merge({:user => current_user}))
	    if @notify[:status]
	    	redirect_to resume_path(:global_key => current_user.resumes.last.global_key)
	    else
	    	render format: :js
	    end
	    

	end 

	def create_employment_experience
		@notify = EmploymentExperience.create_employment_experience(params) 
		resume = Resume.find_by_global_key(params[:resume_global_key])
		@completion_ratio = resume.employment_experiences.completion_ratio(resume)
		@employment_experience =  @notify[:data][:employment_experience]
		render format: :js
	end 

	def update_employment_experience
		@notify = EmploymentExperience.update_employment_experience(params)
		redirect_to resume_path(:global_key => params["resume_global_key"]) 
	end 

	def update_professional_skills
		Skill.update_professional_skills(current_user,params)
		@notify = Notification.notify(true,'Skills are updated')
		render format: :js
	end 
end
