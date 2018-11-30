require 'test_helper'

class HistoryLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_log = history_logs(:one)
  end

  test "should get index" do
    get history_logs_url
    assert_response :redirect
  end


end
