module Mutations
  class AddTeam < Mutations::BaseMutation
    argument :team, Types::Input::TeamInputType, required: true

    field :team, Types::TeamType, null: false

    def resolve(team:)
      team_params = Hash team

      begin
        team = Team.create!(team_params)

        { team: team }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
