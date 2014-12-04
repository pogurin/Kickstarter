class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :backed_projects, through: :pledges, class_name: 'Project' 
  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :pledges

# are all these password validations (7,8) necessary
  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
