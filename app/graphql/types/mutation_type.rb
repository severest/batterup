module Types
  class MutationType < Types::BaseObject
    field :add_team, mutation: Mutations::AddTeam
    field :add_game, mutation: Mutations::AddGame
  end
end
