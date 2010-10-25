class Family < ActiveRecord::Base
  has_many :family_members, :dependent => :destroy
  has_many :chores, :dependent => :destroy
  validates_presence_of :name, :login, :email
  validates_presence_of :email_confirmation
  validates_confirmation_of :email
  
  acts_as_authentic
  
  def week(end_date = DateTime.now)
    # which week are we in now?
    # origin is the week the family was created in
    
    # find the beginning of the next week for the created at
    # convert to utc to protect against any Active Record time shift 
    # which can happen if our UTC in the db flips to a different day
    
    # time difference in days
     diff = end_date.utc - week0_start
     
     # which week we are in?
     (diff / 7).floor
  end
  
  def member?(family_member)
  # is the family_member a member of the family?
   family_members.include?(family_member)
  end
  
  private
  
  def week0_start
    _created_at = created_at.utc
    wday_created = _created_at.wday
    first_day_of_week = created_at.advance(:days => -wday_created)
    DateTime.new(first_day_of_week.year, first_day_of_week.month, first_day_of_week.day) 
  end

end
