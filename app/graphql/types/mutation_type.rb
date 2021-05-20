module Types
  class MutationType < Types::BaseObject
    field :add_team, mutation: Mutations::AddTeam
  end
end
