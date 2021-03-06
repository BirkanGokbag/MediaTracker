require 'test_helper'
#Auto-generated by rails
#Summary: Contains tests for the tv shows controller
#Author: Alyssa Langhals added devise and removed unneccessary tests
class TvShowsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @tv_show = tv_shows(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get tv_shows_url
    assert_response :success
  end

  test "should get new" do
    get new_tv_show_url
    assert_response :success
  end


  test "should update tv_show" do
    patch tv_show_url(@tv_show), params: { tv_show: { general_media_id: @tv_show.general_media_id, numberOfSeasons: @tv_show.numberOfSeasons, totalEpisodes: @tv_show.totalEpisodes } }
    assert_response :success
  end

  test "should destroy tv_show" do
    assert_difference('TvShow.count', -1) do
      delete tv_show_url(@tv_show)
    end

    assert_redirected_to tv_shows_url
  end
end
