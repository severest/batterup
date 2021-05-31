module Queries
  class FetchStadiums < Queries::BaseQuery
    type [Types::StadiumType], null: false

    def resolve
      Stadium.all.order(created_at: :desc)
    end
  end
end
