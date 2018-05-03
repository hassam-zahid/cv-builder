class Notification < ApplicationRecord
	def self.notify(status=true, message = 'Done!', data = {})
		begin
			{:status => status, :message => message, :data => data}
		rescue StandardError=>e
      		ErrorLog.insert_error_and_notify(e, :error_place => 'notification_notify_model')
    	end 	
	end 

	def self.activation_logs(status=1,date=Date.today,old_logs="")
		if !old_logs.nil? && old_logs.length > 4  
			old_logs = old_logs[1...old_logs.length-1]
			"[#{old_logs},{#{date.to_s} : #{status}}]"
		else
			return "[{#{date.to_s} : #{status}}]"
		end 
	end 
end
