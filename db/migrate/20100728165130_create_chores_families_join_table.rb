class CreateChoresFamiliesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chores_families, :id => false do |t|
      t.integer :chore_id
      t.integer :family_id
      t.integer :week
    end
    
    add_index :chores_families, :chore_id
    add_index :chores_families, :family_id
    add_index :chores_families, :week
  end

  def self.down
    remove_index :chores_families, :chore_id
    remove_index :chores_families, :family_id
    remove_index :chores_families, :week
    drop_table :chores_families
  end
end
