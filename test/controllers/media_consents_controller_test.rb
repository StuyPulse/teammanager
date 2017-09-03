require 'test_helper'

class MediaConsentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_consent = media_consents(:one)
  end

  test "should get index" do
    get media_consents_url
    assert_response :success
  end

  test "should get new" do
    get new_media_consent_url
    assert_response :success
  end

  test "should create media_consent" do
    assert_difference('MediaConsent.count') do
      post media_consents_url, params: { media_consent: { student: @media_consent.student, year: @media_consent.year } }
    end

    assert_redirected_to media_consent_url(MediaConsent.last)
  end

  test "should show media_consent" do
    get media_consent_url(@media_consent)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_consent_url(@media_consent)
    assert_response :success
  end

  test "should update media_consent" do
    patch media_consent_url(@media_consent), params: { media_consent: { student: @media_consent.student, year: @media_consent.year } }
    assert_redirected_to media_consent_url(@media_consent)
  end

  test "should destroy media_consent" do
    assert_difference('MediaConsent.count', -1) do
      delete media_consent_url(@media_consent)
    end

    assert_redirected_to media_consents_url
  end
end
