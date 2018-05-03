class City < ApplicationRecord
  belongs_to :country
  has_many :users, dependent: :destroy
  has_many :user_locations, dependent: :destroy


  def self.insert_city(city_name,country)
  		city = country.cities.where(:name => city_name.capitalize).first_or_create
  		city.update(:is_active => true)
  		return city
  end 
  
end
