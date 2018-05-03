class ResumesSkill < ApplicationRecord
  belongs_to :resume
  belongs_to :skill 

  def self.add_resume_skill(resume,skill)
  	if resume.skills.include? skill 
  		rs = ResumesSkill.find_by_resume_id_and_skill_id(resume.id,skill.id)
  		if rs.is_active == false
  			rs.update(:is_active => true, :activation_logs => Notification.activation_logs(1,Date.today,rs.activation_logs))
  		end 
  	else
  		ResumesSkill.create(:resume_id => resume.id, :skill_id => skill.id, :is_active =>true, :activation_logs => Notification.activation_logs)	
  	end 
  end 

  def self.remove_resume_skill(resume,skill)
  end

  def self.add_skills_in_bulk(skill_names,user,resume)
    category = user.category
    skill_names.each do |sn|
      skill = Skill.create_skill(sn,category)
      add_resume_skill(resume,skill)
    end 
  end 

  def template_api_data
    {
      :skill_name => skill.name.capitalize,
      :rate_skill => rate_skill
    }
  end 

  def self.deactivate_all_skills(resume)
    resume.resume_skills.where(:is_active => true).each do |rs|
      rs.update(:is_active => false, :activation_logs => Notification.activation_logs(0,Date.today,rs.activation_logs))
    end
    Notification.notify(true, 'Successfully deactivated all skills') 
  end 
end
