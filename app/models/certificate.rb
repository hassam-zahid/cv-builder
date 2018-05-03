class Certificate < ApplicationRecord
	has_and_belongs_to_many :categories, dependent: :destroy
	has_and_belongs_to_many :resumes, dependent: :destroy
end
