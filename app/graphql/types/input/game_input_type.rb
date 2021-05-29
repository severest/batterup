module Types
  module Input
    class GameInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
      argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
      argument :away_team_id, ID, required: false
      argument :home_team_id, ID, required: false
      argument :stadium_id, ID, required: false
    end
  end
end
