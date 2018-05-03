class CategoriesCompany < ApplicationRecord
  belongs_to :category
  belongs_to :company
end
