class CreateChoresCompleted < ActiveRecord::Migration
  def self.up
    create_table :chores_completed do |t|
      t.integer :chore_id
      t.integer :family_member_id
      t.integer :week

      t.timestamps
    end
  end

  def self.down
    drop_table :chores_completed
  end
end
