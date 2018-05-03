class NotifyMailer < ApplicationMailer
	def notify(email_address,subject,content)
		@content = content
		@date = Time.now
		@subject = subject
    	mail(to: email_address, subject: subject)
	end 
end
