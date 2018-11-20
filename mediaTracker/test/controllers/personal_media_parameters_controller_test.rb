require 'test_helper'

class PersonalMediaParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_media_parameter = personal_media_parameters(:one)
  end

  test "should get index" do
    get personal_media_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_media_parameter_url
    assert_response :success
  end

  test "should create personal_media_parameter" do
    assert_difference('PersonalMediaParameter.count') do
      post personal_media_parameters_url, params: { personal_media_parameter: { comments: @personal_media_parameter.comments, currentStatus: @personal_media_parameter.currentStatus, favorite: @personal_media_parameter.favorite, general_medias_id: @personal_media_parameter.general_medias_id, replay: @personal_media_parameter.replay, score: @personal_media_parameter.score, source: @personal_media_parameter.source, users_id: @personal_media_parameter.users_id } }
    end

    assert_redirected_to personal_media_parameter_url(PersonalMediaParameter.last)
  end

  test "should show personal_media_parameter" do
    get personal_media_parameter_url(@personal_media_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_media_parameter_url(@personal_media_parameter)
    assert_response :success
  end

  test "should update personal_media_parameter" do
    patch personal_media_parameter_url(@personal_media_parameter), params: { personal_media_parameter: { comments: @personal_media_parameter.comments, currentStatus: @personal_media_parameter.currentStatus, favorite: @personal_media_parameter.favorite, general_medias_id: @personal_media_parameter.general_medias_id, replay: @personal_media_parameter.replay, score: @personal_media_parameter.score, source: @personal_media_parameter.source, users_id: @personal_media_parameter.users_id } }
    assert_redirected_to personal_media_parameter_url(@personal_media_parameter)
  end

  test "should destroy personal_media_parameter" do
    assert_difference('PersonalMediaParameter.count', -1) do
      delete personal_media_parameter_url(@personal_media_parameter)
    end

    assert_redirected_to personal_media_parameters_url
  end
end
