class Company < ApplicationRecord
	 has_many :employment_experiences, dependent: :destroy
	 has_and_belongs_to_many :categories, dependent: :destroy
	 has_and_belongs_to_many :job_titles, dependent: :destroy

	 def self.insert_company_by_job_title_and_category(user, company_name, job_title)
	 	company = Company.find_or_create_by(:name => company_name.capitalize)
	 	job_title = JobTitle.find_or_create_by(:name => job_title.capitalize)
	 	if (company.job_titles.include? job_title) == false
	 		company.job_titles << job_title
	 	end 
	 	if (job_title.companies.include? company) == false
	 		job_title.companies << company
	 	end 
	 	if (company.categories.include? user.category ) == false
	 		company.categories << user.category
	 	end 
	 	if (user.category.companies.include? company) == false
	 		user.category.companies << company
	 	end 
	 	return company
	 end 

	 def self.names
	 	Company.all.map{|company| company.name}
	 end 
end
