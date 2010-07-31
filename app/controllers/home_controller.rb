class HomeController < ApplicationController
  
  before_filter :require_family
  
  # WHEN TESTING
  # before_filter :get_family
  
  def index
    
    @admin = true
    # @admin = false
    # @admin = true if params[:admin] == "1" or params[:setup] == "1"
    @family = current_family
    @date = date || DateTime.now
    @week_start = week_start
    @week_end = week_end
    
    
    @week_number = @family.week(@date)
    @family_members = @family.family_members.find(  :all, 
                                                    :conditions => ["active = ?", true])
    @chores = @family.chores.find(  :all,
                                    :conditions => ["active = ?", true])
  
  end
  
  # temp hack so we can debug without having to login
  # def get_family
  #   @family = Family.find_by_login("jones")
  # end
  
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
