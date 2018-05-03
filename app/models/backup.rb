class Backup < ApplicationRecord
	def self.fix_countries 
		language_id = MasterLookup.languages.find_by_key('english').id
		affected_countries = Country.where(:language_id => nil)
		affected_countries.update_all(:language_id => language_id) if affected_countries.count > 0
	end 

	def self.fix_users
	end 


end
