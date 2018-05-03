class Degree < ApplicationRecord
  has_and_belongs_to_many :resumes, dependent: :destroy
end
