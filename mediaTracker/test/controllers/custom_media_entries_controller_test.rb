require 'test_helper'

class CustomMediaEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_media_entry = custom_media_entries(:one)
  end

  test "should get index" do
    get custom_media_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_media_entry_url
    assert_response :success
  end

  test "should create custom_media_entry" do
    assert_difference('CustomMediaEntry.count') do
      post custom_media_entries_url, params: { custom_media_entry: { key: @custom_media_entry.key, value: @custom_media_entry.value } }
    end

    assert_redirected_to custom_media_entry_url(CustomMediaEntry.last)
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
    assert_redirected_to custom_media_entry_url(@custom_media_entry)
  end

  test "should destroy custom_media_entry" do
    assert_difference('CustomMediaEntry.count', -1) do
      delete custom_media_entry_url(@custom_media_entry)
    end

    assert_redirected_to custom_media_entries_url
  end
end
