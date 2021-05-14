require "application_system_test_case"

class StadiaTest < ApplicationSystemTestCase
  setup do
    @stadium = stadia(:skydome)
  end

  test "visiting the index" do
    visit stadia_url
    assert_selector "h1", text: "Stadia"
  end

  test "creating a Stadium" do
    visit stadia_url
    click_on "New Stadium"

    fill_in "Address", with: @stadium.address
    fill_in "Name", with: @stadium.name
    click_on "Create Stadium"

    assert_text "Stadium was successfully created"
    click_on "Back"
  end

  test "updating a Stadium" do
    visit stadia_url
    click_on "Edit", match: :first

    fill_in "Address", with: @stadium.address
    fill_in "Name", with: @stadium.name
    click_on "Update Stadium"

    assert_text "Stadium was successfully updated"
    click_on "Back"
  end
end
