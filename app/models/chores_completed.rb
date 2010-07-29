class ChoresCompleted < ActiveRecord::Base
  belongs_to :chore
  belongs_to :family_member
  validates_presence_of :chore_id, :family_member_id
end
