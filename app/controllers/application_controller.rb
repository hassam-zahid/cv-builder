class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  
  $HEADER_COLOR = "a5983c"
  $APPLICATION_URL = (Rails.env.development?) ? ('http://locahost:3000') : ('http://test.mobirecords.com') 
  
  def user_ip
  	request.remote_ip == '127.0.0.1' ? '103.255.5.77' : request.remote_ip
  end 

  def validate_super_admin
  	redirect_to home_path if current_user.role.name != 'super_admin'
  end 

  def validate_trial_user 
  	redirect_to root_path if current_user.role.name != 'trial_user'
  end 

  def save_user_location
    UserLocation.create_user_location_by_ip_address_and_user(current_user,user_ip) if user_signed_in?
  end 

  def validate_user_profile_availability
    @user = current_user
    redirect_to profile_path if @user.name.nil? ||
                                        @user.phone.nil? ||
                                        @user.category_id.nil? ||
                                        @user.language_code.nil? 
  end 

  def user_login_redirection(user)
    redirect_to home_path if user.role.name == 'trial_user'
    redirect_to admin_index_path if user.role.name == 'super_admin' || user.role.name == 'admin'
  end 

  
  def set_locale
    return I18n.locale         = session[:cv_language_code] if session[:cv_language_code]
    return I18n.locale         = current_user.language_code if user_signed_in?
    language_code              = Api.save_location_and_get_city(user_ip).country.language.code
    session[:cv_language_code] = language_code
    return I18n.locale         = language_code
    return I18n.locale         = "en"
  end 

  def set_specific_language(language_code)
    session[:cv_language_code] = language_code
  end 
end

