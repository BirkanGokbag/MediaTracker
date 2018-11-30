require 'test_helper'

class FollowerTest < ActiveSupport::TestCase
   test "create follower" do
     follower = Follower.new(users_id: 5, user: 5, fTarget: 1)
     assert_equal 1, follower.fTarget
     assert_equal 5, follower.user
   end
end
