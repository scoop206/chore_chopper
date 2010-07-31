class Chore < ActiveRecord::Base
  belongs_to :family
  has_and_belongs_to_many :family_members
  has_many :chores_completed, :dependent => :destroy
  validates_presence_of :name
end
