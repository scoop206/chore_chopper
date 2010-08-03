class ChoresFamilyMember < ActiveRecord::Base
  belongs_to :chore
  belongs_to :family_member
  has_many :chores_family_members_days, :dependent => :delete_all
  has_many :days, :through => :chores_family_members_days
  
  validates_presence_of :chore_id, :family_member_id, :week
  
  def self.get(chore, family_member, week)
    ChoresFamilyMember.find(:first, 
            :conditions => [  "chore_id = ? AND family_member_id = ? AND week = ?",
                              chore, family_member, week ])
  end
  
  def self.assigned?(chore, family_member, week)
    cfm = ChoresFamilyMember.find(:first, 
            :conditions => [  "chore_id = ? AND family_member_id = ? AND week = ?",
                              chore, family_member, week ])
    !cfm.nil?                          
  end
  
end
