require 'test_helper'

class CustomMediaEntriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @custom_media_entry = custom_media_entries(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get custom_media_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_media_entry_url
    assert_response :success
  end


  test "should show custom_media_entry" do
    get custom_media_entry_url(@custom_media_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_media_entry_url(@custom_media_entry)
    assert_response :success
  end

  test "should update custom_media_entry" do
    patch custom_media_entry_url(@custom_media_entry), params: { custom_media_entry: { key: @custom_media_entry.key, value: @custom_media_entry.value } }
    assert_response :success
  end

  test "should destroy custom_media_entry" do
    assert_difference('CustomMediaEntry.count', -1) do
      delete custom_media_entry_url(@custom_media_entry)
    end

    assert_redirected_to custom_media_entries_url
  end
end
