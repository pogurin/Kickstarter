class Reward < ActiveRecord::Base
	belongs_to :project

	validates :name, :description, :amount, :backer_limit, presence: true
	validates :backer_limit, :amount, numericality: { only_integer: true }
end
