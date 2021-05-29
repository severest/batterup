require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { end_time: @game.end_time, stadium_id: @game.stadium_id, start_time: @game.start_time, away_team_id: teams(:yankees).id, home_team_id: teams(:toronto).id } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { end_time: @game.end_time, stadium_id: @game.stadium_id, start_time: @game.start_time, away_team_id: teams(:yankees).id, home_team_id: teams(:toronto).id } }
    assert_redirected_to game_url(@game)
  end

  test "add game" do
    query_string = <<-GRAPHQL
    mutation addGame($game: AddGameInput!) {
      addGame(input: $game) {
        game {
          id
        }
      }
    }
    GRAPHQL
    assert_difference 'Game.count', 1 do
      graphql_query query_string, { game: { game: {awayTeamId: teams(:toronto).id, homeTeamId: teams(:yankees).id, stadiumId: stadia(:skydome).id}}}
    end
  end
  
  test "cant use add game with id" do
    query_string = <<-GRAPHQL
    mutation addGame($game: AddGameInput!) {
      addGame(input: $game) {
        game {
          id
        }
      }
    }
    GRAPHQL
    assert_raises GraphQLError do
      graphql_query query_string, { game: { game: {id: games(:one).id, awayTeamId: teams(:toronto).id, homeTeamId: teams(:yankees).id, stadiumId: stadia(:skydome).id}}}
    end
  end
end
