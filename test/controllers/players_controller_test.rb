require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:tellez)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { name: @player.name } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { name: @player.name } }
    assert_redirected_to player_url(@player)
  end

  test "cant destroy player with games" do
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      delete player_url(@player)
    end
  end

  test "player search list graphql query" do
    query_string = <<-GRAPHQL
    query getPlayers($search: String) {
      players(search: $search) {
        id 
        name
      }
    }
    GRAPHQL
    post graphql_path, params: { query: query_string }
    json_response = JSON.parse(@response.body)
    assert_equal json_response["data"]["players"].length, 5
    post graphql_path, params: { query: query_string, variables: { search: 'jose' } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response["data"]["players"].length, 1
  end

  test "player search by team list graphql query" do
    query_string = <<-GRAPHQL
    query getPlayers($search: String, $teamId: ID) {
      players(search: $search, teamId: $teamId) {
        id 
        name
      }
    }
    GRAPHQL
    post graphql_path, params: { query: query_string, variables: { teamId: teams(:toronto).id } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response["data"]["players"].length, 2
    post graphql_path, params: { query: query_string, variables: { teamId: teams(:toronto).id, search: 'row' } }
    json_response = JSON.parse(@response.body)
    assert_equal json_response["data"]["players"].length, 1
  end
end
