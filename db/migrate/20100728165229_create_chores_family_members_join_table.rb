class CreateChoresFamilyMembersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chores_family_members do |t|
      t.integer :chore_id
      t.integer :family_member_id
      t.integer :week
    end
    
    add_index :chores_family_members, :chore_id
    add_index :chores_family_members, :family_member_id
    
  end

  def self.down
    remove_index :chores_family_members, :chore_id
    remove_index :chores_family_members, :family_member_id
    drop_table :chores_family_members
  end
end
