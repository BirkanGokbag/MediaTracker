require 'test_helper'

class MusicsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @music = musics(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get musics_url
    assert_response :success
  end

  test "should get new" do
    get new_music_url
    assert_response :success
  end


  test "should update music" do
    patch music_url(@music), params: { music: { album: @music.album, artist: @music.artist, general_media_id: @music.general_media_id } }
    assert_response :success
  end

  test "should destroy music" do
    assert_difference('Music.count', -1) do
      delete music_url(@music)
    end

    assert_redirected_to musics_url
  end
end
