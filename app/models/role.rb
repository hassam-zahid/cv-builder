class Role < ApplicationRecord
	has_many :users, dependent: :destroy
	validates :name, uniqueness: true
	validates :access_level, uniqueness: true
end
