class Game < ApplicationRecord
  belongs_to :stadium
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  has_many :player_games, class_name: 'GamePlayer', dependent: :destroy
  has_many :players, through: :game_players
end
