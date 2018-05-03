class LogController < ApplicationController
  before_action :validate_super_admin
  def error_log
  	@errors = ErrorLog.un_fixed_error_logs
  end
end
