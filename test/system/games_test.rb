require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "creating a Game" do
    skip 'Datepicker not implemented'
    visit games_url
    click_on "New Game"

    fill_in "End time", with: @game.end_time
    fill_in "Stadium", with: @game.stadium_id
    fill_in "Start time", with: @game.start_time
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "updating a Game" do
    skip 'Datepicker not implemented'
    visit games_url
    click_on "Edit", match: :first

    fill_in "End time", with: @game.end_time
    fill_in "Stadium", with: @game.stadium_id
    fill_in "Start time", with: @game.start_time
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end
end
