class Project < ActiveRecord::Base
	has_many :rewards
	has_many :backers, through: :pledges, class_name: 'User'
	belongs_to :owner, class_name: 'User'
	accepts_nested_attributes_for :rewards

	validates :title, :funding_goal, :description, presence: true
	validates :funding_goal, numericality: { only_integer: true }

end
