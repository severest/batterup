module Queries
  class FetchTeam < Queries::BaseQuery
    type Types::TeamType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Team.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Team does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
