class GamePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :team
  has_many :player_events, class_name: 'GameEventPlayer', foreign_key: 'game_player_id'
end
