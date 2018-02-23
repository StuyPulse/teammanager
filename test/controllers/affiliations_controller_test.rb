require 'test_helper'

class AffiliationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @affiliation = affiliations(:one)
  end

  test "should get index" do
    get affiliations_url
    assert_response :success
  end

  test "should get new" do
    get new_affiliation_url
    assert_response :success
  end

  test "should create affiliation" do
    assert_difference('Affiliation.count') do
      post affiliations_url, params: { affiliation: { name: @affiliation.name } }
    end

    assert_redirected_to affiliation_url(Affiliation.last)
  end

  test "should show affiliation" do
    get affiliation_url(@affiliation)
    assert_response :success
  end

  test "should get edit" do
    get edit_affiliation_url(@affiliation)
    assert_response :success
  end

  test "should update affiliation" do
    patch affiliation_url(@affiliation), params: { affiliation: { name: @affiliation.name } }
    assert_redirected_to affiliation_url(@affiliation)
  end

  test "should destroy affiliation" do
    assert_difference('Affiliation.count', -1) do
      delete affiliation_url(@affiliation)
    end

    assert_redirected_to affiliations_url
  end
end
