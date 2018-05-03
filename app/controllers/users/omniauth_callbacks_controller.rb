require 'open-uri'
require 'net/http'
require 'json'
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  after_action :save_user_location, :only => [:facebook, :google_oauth2]
  def facebook
    
    user_email = request.env["omniauth.auth"].info.email
    #user_name =request.env["omniauth.auth"].info.name
    user_image = request.env["omniauth.auth"].info.image.sub('http:','https:') + '?type=large'
    res = User.social_accounts_validations(user_email, :ip_address => user_ip, :via => 'facebook')
    if res[:status] == true
        sign_in user = User.find_by_email(user_email)
        common_fector(user, :ip_address => user_ip, :source => 'Facebook', :image_url => user_image)
        user_login_redirection(user)
    else
    end
  end

  def common_fector(user,params={})
      Thread.new do 
        ip_address = params[:ip_addres] || '103.255.5.77'
        source    = params[:source] || 'unknown'
        image_url = params[:image_url] || 'empty'

        Api.save_location_and_get_city(ip_address)
        UserLog.create_log(user, "User is signin using #{source}")
        ImageUrl.create_image_url(user,image_url,params)
      end 
  end 

  def google_oauth2
    
     user_email = request.env["omniauth.auth"].info.email
     #user_name = request.env["omniauth.auth"].info.name 
     user_image = request.env["omniauth.auth"].info.image
     #omni_auth_custome(user_email,user_name,user_image)
     res = User.social_accounts_validations(user_email, :ip_address => user_ip, :via => 'google')
    if res[:status] == true
        sign_in user = User.find_by_email(user_email)
        common_fector(user, :ip_address => user_ip, :source => 'Google', :image_url => user_image)
        user_login_redirection(user)
    else
    end
     
  end 
end