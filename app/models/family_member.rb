class FamilyMember < ActiveRecord::Base
  belongs_to :family
  has_and_belongs_to_many :chores
  has_many :chores_completed, :dependent => :destroy
  validates_presence_of :name, :family_id
  
  def before_destroy
    chores.clear
  end
  
end
