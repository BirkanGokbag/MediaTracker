require 'test_helper'

class MovieTest < ActiveSupport::TestCase
   test "create movie" do
      movie = Movie.new(director: 'M. Night Shamalan')
     assert_equal 'M. Night Shamalan', movie.director 
   end
end
