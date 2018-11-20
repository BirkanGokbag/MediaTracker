require 'test_helper'

class CustomMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_medium = custom_media(:one)
  end

  test "should get index" do
    get custom_media_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_medium_url
    assert_response :success
  end

  test "should create custom_medium" do
    assert_difference('CustomMedium.count') do
      post custom_media_url, params: { custom_medium: { general_medias_id: @custom_medium.general_medias_id, type: @custom_medium.type } }
    end

    assert_redirected_to custom_medium_url(CustomMedium.last)
  end

  test "should show custom_medium" do
    get custom_medium_url(@custom_medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_medium_url(@custom_medium)
    assert_response :success
  end

  test "should update custom_medium" do
    patch custom_medium_url(@custom_medium), params: { custom_medium: { general_medias_id: @custom_medium.general_medias_id, type: @custom_medium.type } }
    assert_redirected_to custom_medium_url(@custom_medium)
  end

  test "should destroy custom_medium" do
    assert_difference('CustomMedium.count', -1) do
      delete custom_medium_url(@custom_medium)
    end

    assert_redirected_to custom_media_url
  end
end
