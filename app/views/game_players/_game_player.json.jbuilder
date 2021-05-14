json.extract! game_player, :id, :player_id, :game_id, :start_inning, :end_inning, :fielding_position, :batting_order_position, :jersey_number, :created_at, :updated_at
json.url game_player_url(game_player, format: :json)
