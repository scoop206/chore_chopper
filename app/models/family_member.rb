class FamilyMember < ActiveRecord::Base
  belongs_to :family
  has_many :chores_family_members
  has_many :chores, :through => :chores_family_members
  has_many :chores_completed, :dependent => :destroy
  validates_presence_of :name, :family_id
  before_destroy :clear_chores
  
  def clear_chores
    chores.clear
  end
  
end
