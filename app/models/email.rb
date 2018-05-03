class Email < ApplicationRecord
	def self.super_admins
		MasterLookup.find_by_key('super_admin_emails').value.split(',')
	end 

	def self.email_to_super_admin(subject,content)
		super_admins.each do |email|
			 NotifyMailer.notify(email, subject, content).deliver
		end
	end 
end
