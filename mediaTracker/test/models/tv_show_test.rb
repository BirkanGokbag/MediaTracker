require 'test_helper'
#Auto-generated by rails
#Summary: Contains tests for the tc_show model
#Author: Alyssa Langhals 
class TvShowTest < ActiveSupport::TestCase
   test "create TV show" do
      show = TvShow.new(numberOfSeasons: 13)
     assert_equal 13, show.numberOfSeasons
   end
end
