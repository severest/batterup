require "application_system_test_case"

class GamePlayersTest < ApplicationSystemTestCase
  setup do
    @game_player = game_players(:one)
  end

  test "visiting the index" do
    visit game_players_url
    assert_selector "h1", text: "Game Players"
  end

  test "creating a Game player" do
    visit game_players_url
    click_on "New Game Player"

    fill_in "End inning", with: @game_player.end_inning
    fill_in "Game", with: @game_player.game_id
    fill_in "Jersey number", with: @game_player.jersey_number
    fill_in "Player", with: @game_player.player_id
    fill_in "Fielding position", with: @game_player.fielding_position
    fill_in "Batting order position", with: @game_player.batting_order_position
    fill_in "Start inning", with: @game_player.start_inning
    click_on "Create Game player"

    assert_text "Game player was successfully created"
    click_on "Back"
  end

  test "updating a Game player" do
    visit game_players_url
    click_on "Edit", match: :first

    fill_in "End inning", with: @game_player.end_inning
    fill_in "Game", with: @game_player.game_id
    fill_in "Jersey number", with: @game_player.jersey_number
    fill_in "Player", with: @game_player.player_id
    fill_in "Fielding position", with: @game_player.fielding_position
    fill_in "Batting order position", with: @game_player.batting_order_position
    fill_in "Start inning", with: @game_player.start_inning
    click_on "Update Game player"

    assert_text "Game player was successfully updated"
    click_on "Back"
  end
end
