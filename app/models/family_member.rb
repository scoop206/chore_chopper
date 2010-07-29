class FamilyMember < ActiveRecord::Base
  belongs_to :family
  has_and_belongs_to_many :chores
  has_many :chores_completed
  validates_presence_of :name, :family_id
end
