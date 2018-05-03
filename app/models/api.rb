require 'net/http'
require 'rubygems'
require 'json'
class Api < ApplicationRecord
	LOCATION_API_URL = "http://ip-api.com/json/"
	def self.save_location(ip_address)
			url = LOCATION_API_URL+ip_address.to_s
			json_data = get_request(url)
			country = Country.insert_country(json_data["country"]).update(:country_code => json_data["countryCode"], :time_zone => json_data["timezone"])
	end 

	def self.save_location_and_get_city(ip_address)
			url = LOCATION_API_URL+ip_address.to_s
			json_data = get_request(url)
			country = Country.insert_country(json_data["country"])
			country.update(:country_code => json_data["countryCode"], :time_zone => json_data["timezone"])
			City.insert_city(json_data["city"],country)
	end 

	def self.get_request(url)
			uri = URI(url)
			JSON.parse(Net::HTTP.get(uri))
	end 

	def self.global_key 
		rand(36**24).to_s(36)
	end 

	def self.get_all_data_of_a_resume(params)
		resume_global_key = params["resume_global_key"]
		resume = Resume.find_by_global_key(resume_global_key)
		data ={
			:resume_global_key => resume_global_key,
			:user => resume.user.template_api_data,
			:employment_experiences => resume.active_employment_experiences.reverse.map{|ex| ex.template_api_data},
			:skills => resume.active_resumes_skills.map{|skill| skill.template_api_data}
		}
	end 

end

