class RemoveWeekFromChoresFamilyMembersDays < ActiveRecord::Migration
  def self.up
    remove_column :chores_family_members_days, :week
  end

  def self.down
  end
end
