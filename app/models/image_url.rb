class ImageUrl < ApplicationRecord
  belongs_to :user
  def self.create_image_url(user,url,params={})
  	fetched_from = params[:fetched_from] || 'unknown'
  	is_active	 = params[:is_active] || true
  	user.image_urls.where(:url => url, :is_active => is_active, :fetched_from => fetched_from).first_or_create
  end 
end
