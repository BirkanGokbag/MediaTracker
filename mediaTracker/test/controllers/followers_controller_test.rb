require 'test_helper'

class FollowersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @music = followers(:one)
    sign_in users(:one)
  end
  
end
