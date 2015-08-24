require 'test_helper'

class CheckInTest < ActiveSupport::TestCase
  
	def setup
		@user = users(:justin)
		# This code is not idiomatically correct.
		@check_in = @user.check_ins.build(campus: "Manheim")
	end
	  test "should be valid" do
	    assert @check_in.valid?
	end
	  test "user id should be present" do
	    @check_in.user_id = nil
	    assert_not @check_in.valid?
	end


end
