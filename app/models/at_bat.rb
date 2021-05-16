class AtBat < ApplicationRecord
  belongs_to :game
  belongs_to :batter, class_name: 'GamePlayer'
  belongs_to :pitcher, class_name: 'GamePlayer'
end
