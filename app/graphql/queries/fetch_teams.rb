module Queries
  class FetchTeams < Queries::BaseQuery

    type [Types::TeamType], null: false

    def resolve
      Team.all.order(created_at: :desc)
    end
  end
end
