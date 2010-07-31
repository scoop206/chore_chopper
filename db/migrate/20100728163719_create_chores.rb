class CreateChores < ActiveRecord::Migration
  def self.up
    create_table :chores do |t|
      t.string :name
      t.integer :family_id
      t.boolean :no_day_tracking, :default => false
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :chores
  end
end
