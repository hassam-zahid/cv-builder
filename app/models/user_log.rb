class UserLog < ApplicationRecord
  belongs_to :user
  def self.create_log(user,activity,params={})
  	Thread.new do 
  		UserLog.create(:user_id => user.id, :activity => activity)
  	end 
  end 
end
