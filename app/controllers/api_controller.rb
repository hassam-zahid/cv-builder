class ApiController < ApplicationController
	def resume_data
		render json: Api.get_all_data_of_a_resume(params)
	end 
end
