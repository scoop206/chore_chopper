class Family < ActiveRecord::Base
  has_many :family_members
  has_and_belongs_to_many :chores
  validates_presence_of :name, :login
  validates_presence_of :email_confirmation
  validates_confirmation_of :email
  
  acts_as_authentic
  

end
