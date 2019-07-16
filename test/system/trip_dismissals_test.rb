require "application_system_test_case"

class TripDismissalsTest < ApplicationSystemTestCase
  setup do
    @trip_dismissal = trip_dismissals(:one)
  end

  test "visiting the index" do
    visit trip_dismissals_url
    assert_selector "h1", text: "Trip Dismissals"
  end

  test "creating a Trip dismissal" do
    visit trip_dismissals_url
    click_on "New Trip Dismissal"

    fill_in "Student", with: @trip_dismissal.student_id
    fill_in "Trip", with: @trip_dismissal.trip_id
    click_on "Create Trip dismissal"

    assert_text "Trip dismissal was successfully created"
    click_on "Back"
  end

  test "updating a Trip dismissal" do
    visit trip_dismissals_url
    click_on "Edit", match: :first

    fill_in "Student", with: @trip_dismissal.student_id
    fill_in "Trip", with: @trip_dismissal.trip_id
    click_on "Update Trip dismissal"

    assert_text "Trip dismissal was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip dismissal" do
    visit trip_dismissals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip dismissal was successfully destroyed"
  end
end
