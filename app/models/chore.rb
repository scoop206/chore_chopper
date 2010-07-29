class Chore < ActiveRecord::Base
  has_and_belongs_to_many :families
  has_and_belongs_to_many :family_members
  has_many :chores_completed
  validates_presence_of :name
end
