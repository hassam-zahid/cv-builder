class Template < ApplicationRecord
  belongs_to :category
  has_many :sub_templates
  has_attached_file :image, styles: { extra: "400x400>" ,medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def self.add_template(user,params)
  	temp = Template.create(:name => params["name"], :global_key => Api.global_key,
  					:description => params["description"], :is_active => true,
  					:category_id => 1, :image => params["image"])
  	temp
  end

  def self.active_template
  	Template.where(:is_active => true)
  end  
end
