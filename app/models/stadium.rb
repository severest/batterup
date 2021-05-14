class Stadium < ApplicationRecord
  has_many :games, dependent: :restrict_with_exception
end
