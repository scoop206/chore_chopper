require File.join(File.dirname(File.dirname(__FILE__)), 'test_helper')

class FamilyTest < ActiveSupport::TestCase
  
  # COMMENTED OUT B/C week0_start is normally private
  # 
  # test "week0_start when created_at is 7-30-2010-12:00:00" do
  #   expected_date = DateTime.new(2010,7,25,0,0,0)
  #   hickle = Family.find_by_login("hickle")
  #   assert expected_date == hickle.week0_start
  # end
  # 
  # test "week0_start when created_at is 7-02-2010-00:00:00" do
  #   expected_date = DateTime.new(2010,6,27,0,0,0)
  #   pickle = Family.find_by_login("pickle")
  #   assert expected_date == pickle.week0_start
  # end
  
  # WEEK
  
  # FORWARD IN TIME A FEW WEEKS
  test "week when end date is 07-30-2010 12:00:00 and created_at is 7-02-2010-00:00:00" do
    expected = 4
    pickle = Family.find_by_login("pickle")
    assert pickle.week(DateTime.new(2010,7,30,12,0,0)) == expected
  end 
  
  # SAME WEEK
  test "week when end date is 07-31-2010 12:00:00 and created_at is 07-30-2010 12:00:00" do
    expected = 0
    hickle = Family.find_by_login("hickle")
    assert hickle.week(DateTime.new(2010,7,31,12,0,0)) == expected
  end 
  
  # BACKWARD IN TIME ONE WEEK
  test "week when end date is 07-24-2010 23:34:34 and created_at is 07-30-2010 12:00:00" do
    expected = -1
    hickle = Family.find_by_login("hickle")
    assert hickle.week(DateTime.new(2010,7,24,23,34,34)) == expected
  end     
  
end
