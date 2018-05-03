class JobTitle < ApplicationRecord
	has_and_belongs_to_many :companies, dependent: :destroy
	has_many :employment_experiences, dependent: :destroy

	 def self.insert_job_titles_in_bulk(job_titles_string)
	 	job_titles = job_titles_string.split(',')
	 	job_titles = job_titles[1..job_titles.length] #removing first "ALL" from job title
	 	job_titles.each do |job|
	 		JobTitle.find_or_create_by(:name => job.capitalize)
	 	end 
	 end 

	 def self.names
	 	JobTitle.all.map{|jt| jt.name} 
	 end

	 def self.create_job_title_with_company(job_title,company_name)
	 	title   = JobTitle.find_or_create_by(:name => job_title.capitalize)
	 	company = Company.find_or_create_by(:name => company_name.capitalize)
	 	if (title.companies.include? company) == false
	 		title.companies << company
	 	end 
	 	if (company.job_titles.include? title) == false
	 		company.job_titles << title
	 	end 
	 	return title
	 end 
end
