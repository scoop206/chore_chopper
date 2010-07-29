class CreateChoresFamiliesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :chores_families, :id => false do |t|
      t.integer :chore_id
      t.integer :family_id
    end
    
    add_index :chores_families, :chore_id
    add_index :chores_families, :family_id
    
  end

  def self.down
    remove_index :chores_families, :chore_id
    remove_index :chores_families, :family_id
    drop_table :chores_families
  end
end
