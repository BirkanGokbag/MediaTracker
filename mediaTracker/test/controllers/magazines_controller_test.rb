require 'test_helper'

class MagazinesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @magazine = magazines(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get magazines_url
    assert_response :success
  end

  test "should get new" do
    get new_magazine_url
    assert_response :success
  end


  test "should update magazine" do
    patch magazine_url(@magazine), params: { magazine: { general_media_id: @magazine.general_media_id, issue: @magazine.issue } }
    assert_response :success
  end

  test "should destroy magazine" do
    assert_difference('Magazine.count', -1) do
      delete magazine_url(@magazine)
    end

    assert_redirected_to magazines_url
  end
end
