class User < ApplicationRecord
  belongs_to :city
  belongs_to :category, optional: true
  belongs_to :role
  has_many :user_locations, dependent: :destroy
  has_many :user_logs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :image_urls, dependent: :destroy
  has_one :profile, dependent: :destroy  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_attached_file :user_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing_user.png"
  validates_attachment_content_type :user_image, content_type: /\Aimage\/.*\z/

  def self.create_user(email, password ,params = {})
        email                 = email 
        password              = password
        password_confirmation = password
        recovery_email        = params[:recovery_email] || email
        account_balance       = params[:account_balance] || 0.0
        allowed_resume        = params[:allowed_resume] || MasterLookup.allowed_resume
        role_id               = params[:role_id] || Role.find_by_name('trial_user').try(:id)
        is_active             = params[:is_active] || true
        ip_address            = params[:ip_address] || '103.255.5.77'
        via                   = params[:via] || 'manual'
        user_city             = Api.save_location_and_get_city(ip_address)
        language_code         = params[:language_code] || "en"
        category_id           = params[:category_id] || 1

        user = User.new(:email => email,
                    :password => password, 
                    :password_confirmation => password_confirmation, 
                    :recovery_email => recovery_email, 
                    :account_balance => account_balance, 
                    :allowed_resume => allowed_resume,
                    :signup_via => via,
                    :role_id => role_id, 
                    :is_active => is_active, 
                    :city_id => user_city.id,
                    :language_code => language_code,
                    :category_id  => category_id)
    
        if user.save
            Thread.new do
              content = "Country = #{user_city.country.name } <br> 
                        Email = #{email} <br> Total Users = #{User.all.where(:is_active => true).count} <hr>"
              Email.email_to_super_admin('New Signup',content) 
            end 
            Profile.create(:user_id => user.id) #creating profile on user creation 
            return Notification.notify(true, 'Account created Successfully')
        else
            return Notification.notify(false, 'Something went wrong please try again in few minutes')
        end  
  end 

  def self.completion_ratio(user,resume)
    data = Hash.new
    data[:profile] = user.profile.completion_ratio
    data[:employment_experience] = resume.employment_experiences.completion_ratio(resume)
    return data
  end

  def self.validate_credentials(email='example@example.com',params = {})
        via         = params[:via] || 'manual'
        password    = params[:password] || 'mysupersecretpassword'
            user = User.find_by_email(email)
            create_user(email,password,:via => via) if user.nil? && via != 'manual'
            return Notification.notify(false, 'User does not exist') if user.nil?
            return Notification.notify(true, 'Valid Credentials') if via != 'manual'
            return Notification.notify(true, 'Valid Credentials') if user.valid_password?(password) 
            return Notification.notify(false, 'Incorrect Password')
  end 

  def self.login(email='example@example.com',params = {})
        via         = params[:via] || 'manual'
        ip_address  = params[:ip_address] || '103.255.5.105'
        password    = params[:password] || 'mysupersecretpassword'
            validation_results = validate_credentials(email,:password => password, :via => via)
            if validation_results[:status] == true
                user = User.find_by_email(email)
                return Notification.notify(true, 'Successfully login')
            else
                return validation_results
            end
  end 

  def self.new_user_validation_and_creation(email, password, password_confirmation, params = {})
        via         = params[:via] || 'manual'
        ip_address     = params[:user_ip] || '103.255.5.105'
            return Notification.notify(false, 'Invalid Email Format') if email.nil? || email.empty? || Validation.valid_email?(email) == false
            return Notification.notify(false, 'Passwords are not same') if password != password_confirmation
            return Notification.notify(false, 'User already exist, please signin') if User.exists?(:email => email)
            create_user(email,password, :ip_address => ip_address, :via => via)
  end 

  #That function is only useable for non manual login/signups
  def self.social_accounts_validations(email_address, params = {})
        user = User.find_by_email(email_address)
        return Notification.notify(true, 'Account already exists') if !user.nil?
        #if user does not exists then
        create_user(email_address, 'mysupersecretpassword' ,params)
  end

  def language
    MasterLookup.languages.find_by_code(self.language_code)
  end 
  
  def make_admin_user
      User.find(self.id).update(:role_id => Role.find_by_name('super_admin').id)
      Notification.notify 
  end

  def self.update_category(user, category_name)
      category = Category.insert_or_update_category(category_name)
      job_title = JobTitle.find_or_create_by(:name => category_name) #it is doing because categories and job titles are almost same
      user.update(:category_id => category.id) ? (return Notification.notify(true, I18n.t("generic.category_is_updated"))) : (return Notification.notify(false, I18n.t("generic.some_thing_went_wrong")))
  end  

  def make_trial_user
    trial_id = Role.find_by_name('trial_user').try(:id) 
    User.find(self.id).update(:role_id => trial_id)
    Notification.notify
  end 

  def resumes
    User.find(self.id).profile.resumes.where(:is_active => true ) 
  end

  def template_api_data
    {:name => name,
     :email => email,
     :skype => skype,
     :phone => phone, 
     :gender => gender,
     :dob => dob,
     :address => address,
     :linked_in => linked_in,
     :language_code => language_code,
     :city => city.name, 
     :country => city.country.name,
     :small_image => $APPLICATION_URL + user_image.url(:thumb).to_s,
     :mediam_image => $APPLICATION_URL + user_image.url(:medium).to_s,
     :original_image => $APPLICATION_URL + user_image.url.to_s
    }
  end 
end
