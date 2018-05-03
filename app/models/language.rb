class Language < ApplicationRecord
	def self.update_user_language(user,language_id)
		validate_language_id = MasterLookup.languages.map{|language| language.id}.include? language_id.to_i
		return Notification.notify(false, 'Language does not exists') if validate_language_id == false
		language_code = MasterLookup.find(language_id).try(:code)
		if user.update(:language_code => language_code) 
			Notification.notify(true, 'Language is Updated Successfully')
		else
			#Language is not updated
		end   
	end
end
