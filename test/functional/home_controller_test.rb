require File.join(File.dirname(File.dirname(__FILE__)), 'test_helper')

class HomeControllerTest < ActionController::TestCase
  
  # Replace this with your real tests.
  test "chore assignment" do
    post :index, :chore_assigned => {"chore#{chores(:wash_dishes).id}_fm#{family_members(:bobby).id}" => "1",
                                     "chore#{chores(:wash_dishes).id}_fm#{family_members(:jimmy).id}" => "0"}
    
    # verify we have a chore for the correct week assigned to bobby
    # verify we don't have a chore for the correct week assigned to jimmy
    
    family = Family.find_by_login("hickle")
    week = family.week
    
    assert ChoresFamilyMember.assigned?(chores(:wash_dishes), family_members(:bobby), week)
    assert !ChoresFamilyMember.assigned?(chores(:wash_dishes), family_members(:jimmy), week)
  end
  
  test "day assignment" do
    post :index, :chore_assigned => {"chore#{chores(:wash_dishes).id}_fm#{family_members(:bobby).id}" => "1",
                                     "chore#{chores(:wash_dishes).id}_fm#{family_members(:jimmy).id}" => "0"},
                  :chore_day_assignment => {"chore#{chores(:wash_dishes).id}_fm#{family_members(:bobby).id}" => {"day2" => "1", "day0" => "1"}}                       
    
    family = Family.find_by_login("hickle")
    week = family.week
    
    days = [2, 0].collect { |_d| Day.find_by_day_of_week(_d) }.each do |day|
      cfm = ChoresFamilyMember.find(:first, :conditions => ["chore_id = ? AND family_member_id = ? AND week = ?", chores(:wash_dishes), family_members(:bobby), week])
      cfmd = ChoresFamilyMembersDay.find(:first, :conditions => ["chores_family_member_id = ? AND day_id = ?", cfm, day])
      assert !cfmd.nil?
    end
    
  end
  
  def setup
    @controller = HomeController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end
  
end
