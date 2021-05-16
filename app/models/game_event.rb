class GameEvent < ApplicationRecord
  belongs_to :at_bat
  has_many :players_involved, class_name: 'GameEventPlayer', foreign_key: 'game_event_id'
end
