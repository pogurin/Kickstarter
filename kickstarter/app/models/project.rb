class Project < ActiveRecord::Base
	has_many :rewards
	has_many :backers, through: :pledges, class_name: 'User'
	belongs_to :owner, class_name: 'User' 
	accepts_nested_attributes_for :rewards
end
