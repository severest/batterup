module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :active_players, [Types::PlayerType], null: false
    def active_players
      object.active_players.includes(:player).where(effective_stop: nil).map { |c| c.player }
    end
  end
end
