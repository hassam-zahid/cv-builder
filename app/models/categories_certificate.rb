class CategoriesCertificate < ApplicationRecord
  belongs_to :category
  belongs_to :certificate
end
