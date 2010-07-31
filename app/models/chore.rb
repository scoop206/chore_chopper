class Chore < ActiveRecord::Base
  belongs_to :family
  has_many :chores_family_members
  has_many :family_members, :through => :chores_family_members
  has_many :chores_completed, :dependent => :destroy
  validates_presence_of :name, :family_id
end
