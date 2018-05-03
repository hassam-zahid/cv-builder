class CompaniesJobTitle < ApplicationRecord
  belongs_to :company
  belongs_to :job_title
end
