require "test_helper"

class GamePlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_player = game_players(:one)
  end

  test "should get index" do
    get game_players_url
    assert_response :success
  end

  test "should get new" do
    get new_game_player_url
    assert_response :success
  end

  test "should create game_player" do
    assert_difference('GamePlayer.count') do
      post game_players_url, params: { game_player: { end_inning: @game_player.end_inning, game_id: @game_player.game_id, team_id: @game_player.team_id, jersey_number: @game_player.jersey_number, player_id: @game_player.player_id, batting_order_position: @game_player.batting_order_position, fielding_position: @game_player.fielding_position, start_inning: @game_player.start_inning } }
    end

    assert_redirected_to game_player_url(GamePlayer.last)
  end

  test "should show game_player" do
    get game_player_url(@game_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_player_url(@game_player)
    assert_response :success
  end

  test "should update game_player" do
    patch game_player_url(@game_player), params: { game_player: { end_inning: @game_player.end_inning, game_id: @game_player.game_id, team_id: @game_player.team_id, jersey_number: @game_player.jersey_number, player_id: @game_player.player_id, batting_order_position: @game_player.batting_order_position, fielding_position: @game_player.fielding_position, start_inning: @game_player.start_inning } }
    assert_redirected_to game_player_url(@game_player)
  end
end
