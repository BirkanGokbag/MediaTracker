require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get faq" do
    get static_pages_faq_url
    assert_response :success
  end

  test "should get add media" do
    get static_pages_addMedia_url
    assert_response :success
  end

  test "should add music, general media, and personal media parameters and add a history message" do
    assert_difference(['Music.count', 'GeneralMedium.count', 'PersonalMediaParameter.count', 'HistoryLog.count'], 1) do
      post static_pages_form_url, params: { score: {temp: 1},replay: {temp: 1},currentStatus: "Finished", name: "River Lea", artist: "Adele", album: "21", commit: "Submit Music Media"}
    end
    
    assert_response :redirect
  end

  #TODO
  test "should add remove media" do
    assert_difference(['Music.count', 'GeneralMedium.count'], 1) do
      post static_pages_form_url, params: { score: {temp: 1},replay: {temp: 1},currentStatus: "Finished", name: "River Lea", artist: "Adele", album: "21", commit: "Submit Music Media"}
    end
    
    assert_response :redirect
  end

  test "should edit media" do
    assert_difference(['Music.count', 'GeneralMedium.count'], 1) do
      post static_pages_form_url, params: { score: {temp: 1},replay: {temp: 1},currentStatus: "Finished", name: "River Lea", artist: "Adele", album: "21", commit: "Submit Music Media"}
    end
    
    assert_response :redirect
  end
  test "should add custom media" do
    assert_difference(['Music.count', 'GeneralMedium.count'], 1) do
      post static_pages_form_url, params: { score: {temp: 1},replay: {temp: 1},currentStatus: "Finished", name: "River Lea", artist: "Adele", album: "21", commit: "Submit Music Media"}
    end
    
    assert_response :redirect
  end

end
