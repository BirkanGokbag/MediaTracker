require 'test_helper'

class CustomMediaControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @custom_medium = custom_media(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get custom_media_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_medium_url
    assert_response :success
  end


  test "should update custom_medium" do
    patch custom_medium_url(@custom_medium), params: { custom_medium: { general_media_id: @custom_medium.general_media_id, typeOfMedia: @custom_medium.typeOfMedia } }
    assert_response :success
  end

  test "should destroy custom_medium" do
    assert_difference('CustomMedium.count', -1) do
      delete custom_medium_url(@custom_medium)
    end

    assert_redirected_to custom_media_url
  end
end
