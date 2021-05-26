class Player < ApplicationRecord
    has_many :played_games, class_name: 'GamePlayer', dependent: :restrict_with_exception
    has_many :active_roster_spots, class_name: 'ActiveRosterPlayer', dependent: :restrict_with_exception
    has_many :games, through: :game_players
end
