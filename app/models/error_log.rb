class ErrorLog < ApplicationRecord
	def self.insert_error(error,params={})
		return Notification.notify(false, 'Nil Error') if error.nil?
		error_place 	= params[:error_place].to_s || 'not defined'
      	error_class 	= error.try(:class).try(:name).to_s || 'not defined'
      	error_message	= error.try(:message).to_s || 'not defined'
      	error_backtrace	= error.try(:backtrace).to_s || 'not defined'
      	fixed_by		= params[:fixed_by] || nil
      	is_fixed		= params[:is_fixed] || false
      	priority		= params[:priority] || MasterLookup.find_by_key('very_high').id
      	err = ErrorLog.new(:error_place => error_place,
      					:error_class => error_class,
      					:error_message => error_message,
      					:error_backtrace => error_backtrace,
      					:fixed_by => fixed_by,
      					:is_fixed => is_fixed,
      					:priority => priority)
      	if err.save
      		return Notification.notify(true)
      	else
      		return Notification.notify(false, 'Error Logs are not saving') 
      	end 
	end 

      def self.insert_error_and_notify(error,params={})
            Thread.new do 
                  content = "<h2> Error in : #{params[:error_place] || 'not defined'} <br>
                              Error Class : #{error.try(:class).try(:name).to_s || 'not defined'} <br>
                              Error Message : #{ error.try(:message).to_s || 'not defined'}</h2>
                              <hr>#{ error.try(:backtrace).to_s}"
                  Email.email_to_super_admin('CV ERROR ALERT',content)
            end 
            insert_error(error,params)
            Notification.notify(false,'We are updating this feature, will available in free minutes')
      end 

      def self.error_logs(params = {})
            start_date   = params[:start_date] || Time.now - 24*60*60 
            end_date     = params[:end_date] || Time.now
            ErrorLog.where(:created_at => start_date..end_date)
      end
      
      def self.fixed_error_logs(params = {})
            start_date   = params[:start_date] || Time.now - 24*60*60 
            end_date     = params[:end_date] || Time.now
            ErrorLog.where(:created_at => start_date..end_date, :is_fixed => true)
      end  

      def self.un_fixed_error_logs(params = {})
            start_date   = params[:start_date] || Time.now - 24*60*60 
            end_date     = params[:end_date] || Time.now
            ErrorLog.where(:created_at => start_date .. end_date, :is_fixed => false)
      end  

end





#puts '======================='
             #puts "Exception Class: #{ e.class.name }"
             #puts "Exception Message: #{ e.message }"
             #puts "Exception Backtrace: #{ e.backtrace }"
#puts '============================='