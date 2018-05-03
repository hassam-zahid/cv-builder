class Validation < ApplicationRecord
	def self.valid_email?(email)
		begin
			validate_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
			result = email =~ validate_email_regex 
			result == 0 ? true : false
		rescue StandardError=>e
      		ErrorLog.insert_error_and_notify(e, :error_place => 'validation_valid_email_model')
    	end 
	end 
end
