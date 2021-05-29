module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime, null: true
    field :end_time, GraphQL::Types::ISO8601DateTime, null: true
    field :away_team, Types::TeamType, null: false
    field :home_team, Types::TeamType, null: false
    field :stadium, Types::StadiumType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
