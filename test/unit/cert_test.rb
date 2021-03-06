require 'test_helper'
#TODO Need to add a test for when both cert.expiration_date and course.term are blank
class CertTest < ActiveSupport::TestCase
  test "should complete expiration date" do
    evoc_course = FactoryGirl.create(:course, term: 100)
    drivingcert = FactoryGirl.create(:cert, course: evoc_course)
    person = drivingcert.person
    assert_equal drivingcert.issued_date, Date.today
    
    assert_equal Date.today + evoc_course.term.to_i.months, drivingcert.expiration_date, 'Expiration not set properly'
  end  

end
