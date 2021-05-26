class Team < ApplicationRecord
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id", dependent: :restrict_with_exception
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id", dependent: :restrict_with_exception
  has_many :active_players, class_name: "ActiveRosterPlayer", dependent: :restrict_with_exception
  validates :name, presence: true
end
