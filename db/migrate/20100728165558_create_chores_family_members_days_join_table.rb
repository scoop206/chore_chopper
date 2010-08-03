class CreateChoresFamilyMembersDaysJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chores_family_members_days, :id => false do |t|
      t.integer :chores_family_member_id
      t.integer :day_id
      t.integer :week
    end
  end

  def self.down
    drop_table :chores_family_members_days
  end
end
