require 'date'
class Profile < ApplicationRecord
  belongs_to :user
  has_many :resumes, dependent: :destroy

  def self.profile_after_signup(user,params={})
    return Notification.notify(false, I18n.t("generic.invalid_user")) if user.nil?
    permited_params = params.require(:user).permit(:user_image,:name, :phone, :skype, :linked_in, :dob, :gender, :address, :recovery_email)
    if user.update(permited_params)
    	return Notification.notify(true, I18n.t("profile.profile_is_updated"))
    else
    	return Notification.notify(false,I18n.t("profile.some_thing_went_wrong"))
    end 
  end

  def completion_ratio
    user = Profile.find(self.id).user
    total_fields = 9
    ob_fields = 0
    ob_fields = (ob_fields + 1) if !user.recovery_email.nil?
    ob_fields = (ob_fields + 1) if !user.name.nil? && user.name.length > 2
    ob_fields = (ob_fields + 1) if !user.skype.nil? && user.skype.length > 2
    ob_fields = (ob_fields + 1) if !user.phone.nil? && user.phone.length > 2
    ob_fields = (ob_fields + 1) if !user.gender.nil? && user.gender.length > 2
    ob_fields = (ob_fields + 1) if !user.dob.nil? 
    ob_fields = (ob_fields + 1) if !user.address.nil? && user.address.length > 2
    ob_fields = (ob_fields + 1) if !user.linked_in.nil? && user.linked_in.length > 2
    ob_fields = (ob_fields + 1) if user.user_image.exists?
    cp_ratio = ((ob_fields.to_f * 100.0)/(total_fields.to_f)).to_i
  end

end

