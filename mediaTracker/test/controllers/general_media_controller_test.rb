require 'test_helper'

class GeneralMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_medium = general_media(:one)
  end

  test "should get index" do
    get general_media_url
    assert_response :success
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

  test "should show general_medium" do
    get general_medium_url(@general_medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_medium_url(@general_medium)
    assert_response :success
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
