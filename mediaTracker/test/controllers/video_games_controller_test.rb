require 'test_helper'

class VideoGamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @video_game = video_games(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get video_games_url
    assert_response :success
  end

  test "should get new" do
    get new_video_game_url
    assert_response :success
  end


  test "should update video_game" do
    patch video_game_url(@video_game), params: { video_game: { general_media_id: @video_game.general_media_id, studio: @video_game.studio, system: @video_game.system } }
    assert_response :success
  end

  test "should destroy video_game" do
    assert_difference('VideoGame.count', -1) do
      delete video_game_url(@video_game)
    end

    assert_redirected_to video_games_url
  end
end
