class MasterLookup < ApplicationRecord
	validates :key, uniqueness: true

	def self.priorities
		MasterLookup.where(:category => 'PRIORITY', :is_active => true)
	end 

	def self.languages 
		MasterLookup.where(:category => 'LANGUAGE', :is_active => true)
	end 

	def self.allowed_resume 
		MasterLookup.find_by_key_and_is_active('trial_allowed_resumes',true).value.to_i
	end 
end
