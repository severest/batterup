module Mutations
  class AddGame < Mutations::BaseMutation
    argument :game, Types::Input::GameInputType, required: true

    field :game, Types::GameType, null: false

    def resolve(game:)
      game_params = Hash game
      return GraphQL::ExecutionError.new("addGame only creates new games") if game_params.has_key? :id
      
      begin
        game = Game.create!(game_params)

        { game: game }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
