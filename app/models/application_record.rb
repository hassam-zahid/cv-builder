class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  $APPLICATION_URL = (Rails.env.development?) ? ('http://locahost:3000') : ('http://test.mobirecords.com')
end
