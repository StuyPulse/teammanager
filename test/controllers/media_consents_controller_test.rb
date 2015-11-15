require 'test_helper'

class MediaConsentsControllerTest < ActionController::TestCase
  setup do
    @media_consent = media_consents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_consents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_consent" do
    assert_difference('MediaConsent.count') do
      post :create, media_consent: { student_id: @media_consent.student_id, year: @media_consent.year }
    end

    assert_redirected_to media_consent_path(assigns(:media_consent))
  end

  test "should show media_consent" do
    get :show, id: @media_consent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_consent
    assert_response :success
  end

  test "should update media_consent" do
    patch :update, id: @media_consent, media_consent: { student_id: @media_consent.student_id, year: @media_consent.year }
    assert_redirected_to media_consent_path(assigns(:media_consent))
  end

  test "should destroy media_consent" do
    assert_difference('MediaConsent.count', -1) do
      delete :destroy, id: @media_consent
    end

    assert_redirected_to media_consents_path
  end
end
