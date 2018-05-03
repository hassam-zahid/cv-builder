class Category < ApplicationRecord
	 has_and_belongs_to_many :companies, dependent: :destroy
	 has_and_belongs_to_many :interests, dependent: :destroy
	 has_and_belongs_to_many :certificates, dependent: :destroy
	 has_many :skills, dependent: :destroy
	 has_many :users, dependent: :destroy


	 def self.insert_categories_in_bulk(categories_string)
	 	categories = categories_string.split(',')
	 	categories.each do |cat|
	 		Category.find_or_create_by(:name => cat.capitalize)
	 	end 
	 end 

	 def self.insert_or_update_category(category_name)
	 	 cat_name = category_name.to_s.capitalize
	 	 category = Category.find_by_name(cat_name)
	 	 if category.nil?
	 	 	return Category.create(:name => cat_name)
	 	 else
	 	 	category.update(:is_active => true)
	 	 	return category
	 	 end 
	 end 

	 def self.update_category(user,params)
	 	category_validation = validate_category(params[:id])
	 	return category_validation if category_validation[:status] == false
	 	if user.update(:category_id => params[:id])
	 		return Notification.notify(true, I18n.t("generic.category_is_updated"))
	 	else
	 		return Notification.notify(false, I18n.t("generic.some_thing_went_wrong"))
	 	end 
	 end

	 def self.validate_category(category_id)
	 	active_categories.find_by_id(category_id).nil? ? (return Notification.notify(false, I18n.t("generic.invalid_category"))) : (return Notification.notify(true,I18n.t("generic.valid_category")))
	 end 

	 def self.active_categories
	 	Category.all.where(:is_active => true)
	 end 
end
