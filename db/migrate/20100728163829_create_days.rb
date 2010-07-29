class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.string :name
      t.integer :day_of_week
      t.string :abbreviation
      t.timestamps
    end
    
    # create the seven days of the week
    Day.create( :name => "Sunday", :abbreviation => "Su", :day_of_week => "0" )
    Day.create( :name => "Monday", :abbreviation => "M", :day_of_week => "1" )
    Day.create( :name => "Tuesday", :abbreviation => "T", :day_of_week => "2" )
    Day.create( :name => "Wednesday", :abbreviation => "W", :day_of_week => "3" )
    Day.create( :name => "Thursday", :abbreviation => "Th", :day_of_week => "4" )
    Day.create( :name => "Friday", :abbreviation => "F", :day_of_week => "5" )
    Day.create( :name => "Saturday", :abbreviation => "Sa", :day_of_week => "6" )                        
    
  end

  def self.down
    drop_table :days
  end
end
