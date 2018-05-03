class AdminController < ApplicationController
	before_action :validate_super_admin
  	def index
  	end

  	def users
  		@users = User.all
  	end 

  	def templates
      @templates = Template.active_template
  	end 

  	def add_template 
  		temp = Template.add_template(current_user, params)
      redirect_to admin_templates_path  
  	end 

end
