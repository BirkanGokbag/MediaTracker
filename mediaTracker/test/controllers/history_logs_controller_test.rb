require 'test_helper'

class HistoryLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_log = history_logs(:one)
  end

  test "should get index" do
    get history_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_history_log_url
    assert_response :success
  end

  test "should create history_log" do
    assert_difference('HistoryLog.count') do
      post history_logs_url, params: { history_log: { historyMessage: @history_log.historyMessage, users_id: @history_log.users_id } }
    end

    assert_redirected_to history_log_url(HistoryLog.last)
  end

  test "should show history_log" do
    get history_log_url(@history_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_log_url(@history_log)
    assert_response :success
  end

  test "should update history_log" do
    patch history_log_url(@history_log), params: { history_log: { historyMessage: @history_log.historyMessage, users_id: @history_log.users_id } }
    assert_redirected_to history_log_url(@history_log)
  end

  test "should destroy history_log" do
    assert_difference('HistoryLog.count', -1) do
      delete history_log_url(@history_log)
    end

    assert_redirected_to history_logs_url
  end
end
