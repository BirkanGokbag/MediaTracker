require 'test_helper'

class HistoryLogsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @history_log = history_logs(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get history_logs_url
    assert_response :ok
  end


end
