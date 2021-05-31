require "test_helper"

class StadiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stadium = stadia(:skydome)
  end

  test "should get index" do
    get stadia_url
    assert_response :success
  end

  test "should get new" do
    get new_stadium_url
    assert_response :success
  end

  test "should create stadium" do
    assert_difference('Stadium.count') do
      post stadia_url, params: { stadium: { address: @stadium.address, name: @stadium.name } }
    end

    assert_redirected_to stadium_url(Stadium.last)
  end

  test "should show stadium" do
    get stadium_url(@stadium)
    assert_response :success
  end

  test "should get edit" do
    get edit_stadium_url(@stadium)
    assert_response :success
  end

  test "should update stadium" do
    patch stadium_url(@stadium), params: { stadium: { address: @stadium.address, name: @stadium.name } }
    assert_redirected_to stadium_url(@stadium)
  end

  test "cant destroy stadium with games" do
    assert_raises(ActiveRecord::DeleteRestrictionError) do
      delete stadium_url(@stadium)
    end
  end

  test "stadiums list graphql query" do
    query_string = <<-GRAPHQL
    {
      stadiums {
        id 
        name
        address
      }
    }
    GRAPHQL
    json_response = graphql_query query_string
    assert_equal json_response["data"]["stadiums"].length, 2
  end
end
