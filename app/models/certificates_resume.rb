class CertificatesResume < ApplicationRecord
  belongs_to :certificate
  belongs_to :resume
end
