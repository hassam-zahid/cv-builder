class EmploymentExperience < ApplicationRecord
  belongs_to :job_title
  belongs_to :company
  belongs_to :resume 


  def self.create_employment_experience(params = {}) 
      resume            = Resume.find_by_global_key(params["resume_global_key"])
      job_title         = JobTitle.create_job_title_with_company(params["job_title"], params["company_name"])
      company           = Company.insert_company_by_job_title_and_category(resume.user, params["company_name"], params["job_title"])
      start_date        = params["start_date"]
      end_date          = params["end_date"]
      description       = params["description"]
      emp_experience    = resume.employment_experiences.create(:job_title_id => job_title.id,
                                                               :company_id => company.id,
                                                               :resume_id => resume.id,
                                                               :start_date => start_date,
                                                               :end_date => end_date,
                                                               :description => description,
                                                               :global_key => Api.global_key)
      
      (!emp_experience.nil?) ? (return Notification.notify(true,I18n.t("job_experiences.experience_added"), {:employment_experience => emp_experience})) : ( return Notification.notify(false,I18n.t("generic.some_thing_went_wrong"))) 
  end 

  def self.update_employment_experience(params = {})
      resume            = Resume.find_by_global_key(params["resume_global_key"])
      job_title         = JobTitle.create_job_title_with_company(params["job_title"], params["company_name"])
      company           = Company.insert_company_by_job_title_and_category(resume.user, params["company_name"], params["job_title"])
      start_date        = params["start_date"]
      end_date          = params["end_date"]
      description       = params["description"] 
      emp_exp_ack       = resume.employment_experiences.find_by_global_key(params["exp_global_key"]).update(:job_title_id => job_title.id,
                                                               :company_id => company.id,
                                                               :resume_id => resume.id,
                                                               :start_date => start_date,
                                                               :end_date => end_date,
                                                               :description => description)
  end 

  def destroy
    self.update(:is_active => false)
  end 

  def user
    self.resume.user 
  end 

  def template_api_data
    {
      :job_title => job_title.name,
      :company_name => company.name,
      :start_date => start_date,
      :end_date => end_date,
      :description => description
    }
  end

  def self.completion_ratio(resume)
  	return 0 if resume.active_employment_experiences.empty?
  	total_fields = 0
    ob_fields = 0
    resume.active_employment_experiences.each do |exp|
  		total_fields = total_fields+5
  		ob_fields    = (ob_fields + 1) if !exp.job_title_id.nil?
  		ob_fields    = (ob_fields + 1) if !exp.company_id.nil?
  		ob_fields    = (ob_fields + 1) if !exp.start_date.nil?
  		ob_fields    = (ob_fields + 1) if !exp.end_date.nil?
  		ob_fields    = (ob_fields + 1) if !exp.description.nil? && exp.description.length > 2
	end
	((ob_fields.to_f * 100.0)/(total_fields.to_f)).to_i
  end 

end
