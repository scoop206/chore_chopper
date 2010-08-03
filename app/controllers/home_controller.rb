class HomeController < ApplicationController
  
  before_filter :require_family
  
  # WHEN TESTING
  # before_filter :get_family
  
  def index
    
    @admin = true
    # @admin = false
    # @admin = true if params[:admin] == "1" or params[:setup] == "1"
    @date = date || DateTime.now
    @week_start = week_start
    @week_end = week_end
    
    @week = @current_family.week(@date)
    @family_members = @current_family.family_members.find(  :all, 
                                                    :conditions => ["active = ?", true])
    @chores = @current_family.chores.find(  :all,
                                    :conditions => ["active = ?", true])
    @days = Day.all 
    
    # CHORE ASSIGNMENTS
    # update chore assignments if the setup page was saved
    unless params[:chore_assigned].nil?
       params[:chore_assigned].each do |key, value|
        
        _chore, _fm = key.split('_')
        chore = Chore.find(_chore.gsub('chore','').to_i)
        fm = FamilyMember.find(_fm.gsub('fm','').to_i)
        
        # try to get a ChoresFamilyMember we can play with
        cfm = ChoresFamilyMember.find(:first, 
                  :conditions => ["family_member_id = ? AND chore_id = ? AND week = ?", fm, chore, @week])
        
        if value == "1"  # chore is assigned
           if cfm.nil?
             cfm = ChoresFamilyMember.create( :family_member => fm, :chore => chore, :week => @week)
           end   
        else # value is 0, so remove
           unless cfm.nil?
             cfm.destroy
           end
        end
      end
    end 
    
    # CHORE DAY ASSIGNMENTS
    # update chore day assignments if the setup page was saved
    unless params[:chore_day_assignment].nil?
      params[:chore_day_assignment].each do |_cfm, _cfm_days|
        
        _chore, _fm, _day = _cfm.split('_')
        chore = _chore.gsub('chore','').to_i
        fm = _fm.gsub('fm','').to_i
        
        # get the CFM that matches this week
        cfm = ChoresFamilyMember.find(:first, 
                :conditions => ["chore_id = ? AND family_member_id = ? AND week = ?", chore, fm, @week])
        
        # if cfm does not exist then skip this one (can happen when user removes assignment but days still selected)
        next if cfm.nil?
        
        # remove all days that were previously associated
        cfm.days.clear
        
        # add the new
        _cfm_days.each do |key, value|
          day = Day.find_by_day_of_week(key.gsub('day','').to_i)
          cfm.days << day
        end
      end
    end                             
  
  end
  
  # temp hack so we can debug without having to login
  def get_family
    @current_family = Family.find_by_login("hickle")
  end
  
  private 
  
  def date
    unless params[:date].nil?
      year, month, day = params[:date].split('-')
      DateTime.new(year, month, day)
    end
  end
  
  def week_start
    @date.advance(:days => -@date.wday)
  end
  
  def week_end
    week_end = nil
    if @date.wday == 0
      week_end = @date.advance(:days => 6)
    else
      @date.advance(:days => (6 - @date.wday))
    end
  end

end
