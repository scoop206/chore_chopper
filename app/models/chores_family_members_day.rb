class ChoresFamilyMembersDay < ActiveRecord::Base
  belongs_to :chores_family_member
  belongs_to :day
  validates_presence_of :chores_family_member_id, :day_id
end
