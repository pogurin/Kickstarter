class Project < ActiveRecord::Base
	has_many :rewards
	has_many :pledges
	has_many :backers, through: :pledges, class_name: 'User'
	belongs_to :owner, class_name: 'User' 
	accepts_nested_attributes_for :rewards
	accepts_nested_attributes_for :pledges
end
