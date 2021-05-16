class GameEventPlayer < ApplicationRecord
  belongs_to :game_event
  belongs_to :game_player
end
