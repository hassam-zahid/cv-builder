class TemplateController < ApplicationController
  layout false#, only: [:index]
  def index
  end

  def orbit
  end 

  def landser
  	@resume = Resume.find_by_global_key(params[:resume])
  end 

  def template
  	
  end 

  def show_template
    @template = Template.find_by_global_key(params[:template_global_key])
    @resume_global_key = params[:resume_global_key]
    @resume_data = Api.get_all_data_of_a_resume(params).to_json
  end 

  def ui_resume_template
    @template = Template.find_by_global_key(params[:template_global_key]) || Template.last
    @resume = Resume.find_by_global_key(params[:resume_global_key]) || Resume.last
    @template_file = "template/#{@template.template_file_name}"
  end 

  
end
