class CreateChoresFamilyMembersDaysJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chores_family_members_days, :id => false do |t|
      t.integer :chore_family_member_id
      t.integer :day_id
    end
  end

  def self.down
  end
end
