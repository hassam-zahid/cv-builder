class Skill < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :resumes, dependent: :destroy

  def users 
  end 
  
  def self.create_skill(skill_name,category)
  	skill = Skill.find_or_create_by(:name => skill_name.upcase,:category_id => category.id)
  	skill.update(:is_active => true)
  	skill
  end 

  def self.add_resume_skill(resume,skill)
  
  end 

  def self.remove_resume_skill(resume,skill)
  end

  def active_skills
  end 

  def self.update_professional_skills(user,params)
    skill_names = params["professioanl_skills"].split(',')
    resume = Resume.find_by_global_key(params["resume_global_key"])
    deactivate_all_skills(resume)
    ResumesSkill.add_skills_in_bulk(skill_names,user,resume)
  end 

  def self.deactivate_all_skills(resume)
    ResumesSkill.deactivate_all_skills(resume)
  end 

end
