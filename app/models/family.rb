class Family < ActiveRecord::Base
  has_many :family_members
  has_and_belongs_to_many :chores
  validates_presence_of :name, :login
end
