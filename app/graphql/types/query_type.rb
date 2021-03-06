module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :teams, resolver: Queries::FetchTeams
    field :team, resolver: Queries::FetchTeam
    field :players, resolver: Queries::FetchPlayers
    field :stadiums, resolver: Queries::FetchStadiums
  end
end
