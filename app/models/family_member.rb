class FamilyMember < ActiveRecord::Base
  belongs_to :family
  has_many :chores_family_members
  has_many :chores, :through => :chores_family_members
  has_many :chores_completed, :dependent => :destroy
  validates_presence_of :name, :family_id
  
  def before_destroy
    chores.clear
  end
  
end
