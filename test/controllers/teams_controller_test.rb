require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:toronto)
  end

  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post teams_url, params: { team: { name: @team.name } }
    end

    assert_redirected_to team_url(Team.last)
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team), params: { team: { name: @team.name } }
    assert_redirected_to team_url(@team)
  end

  test "cant destroy team with games" do
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      delete team_url(@team)
    end
  end

  test "can only destroy team that doesn't have games" do
    team = Team.create(name: 'No games team')
    assert_difference('Team.count', -1) do
      delete team_url(team)
    end

    assert_redirected_to teams_url
  end

  test "teams list graphql query" do
    query_string = <<-GRAPHQL
    {
      teams {
        id 
        name
        activePlayers {
          id 
          name
        }
      }
    }
    GRAPHQL
    post graphql_path, params: { query: query_string }
    json_response = JSON.parse(@response.body)
    assert_equal json_response["data"]["teams"].length, 2
    assert_equal json_response["data"]["teams"][0]["activePlayers"].length, 2
  end
end
