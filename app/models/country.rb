class Country < ApplicationRecord
	has_many :cities, dependent: :destroy
	
	validates :name, uniqueness: true
	#validates :country_code, uniqueness: true
	#validates :cell_code, uniqueness: true
	
	def self.users
			cities.map{|city| city.users}.flatten
	end 
	
	def self.insert_country(country_name, params={})

			language_id	= params[:language_id] || MasterLookup.languages.find_by_key('english').id
			country = Country.find_or_create_by!(:name => country_name.capitalize)
			country.update(:is_active => true) if country.is_active != true
			country.update(:language_id => language_id ) if country.language_id.nil? || params[:language_id]
			return country
		 
	end

	def self.country_names
			Country.all.map(&:name)
	end  

	def self.delete_country(country_name,params={})
			country = Country.find_by_name(country_name.capitalize)
			country.update(:is_active => false, :logs => country.logs+" #{Date.today.to_s} : 0,") if !country.nil?
	end

	def language
		MasterLookup.find(self.language_id)
	end 

end


