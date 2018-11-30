require 'test_helper'

class GeneralMediaControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @general_medium = general_media(:one)
    sign_in users(:one)
  end


  test "should get new" do
    get new_general_medium_url
    assert_response :success
  end

  test "should create general_medium" do
    assert_difference('GeneralMedium.count') do
      post general_media_url, params: { general_medium: { name: @general_medium.name } }
    end

    assert_redirected_to general_medium_url(GeneralMedium.last)
  end

  test "should update general_medium" do
    patch general_medium_url(@general_medium), params: { general_medium: { name: @general_medium.name } }
    assert_redirected_to general_medium_url(@general_medium)
  end

  test "should destroy general_medium" do
    assert_difference('GeneralMedium.count', -1) do
      delete general_medium_url(@general_medium)
    end

    assert_redirected_to general_media_url
  end
end
