class UserLocation < ApplicationRecord
  belongs_to :city
  belongs_to :user

  def self.create_user_location(user,ip_address,city)
  		user.user_locations.create(:ip_address => ip_address, :city_id => city.id)
  end 

  def self.create_user_location_by_ip_address_and_user(user,ip_address)
  		city = Api.save_location_and_get_city(ip_address)
  		user.user_locations.create(:ip_address => ip_address, :city_id => city.id)
  end 
end
