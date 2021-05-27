module Queries
  class FetchPlayers < Queries::BaseQuery
    type [Types::PlayerType], null: false
    argument :search, String, required: false
    argument :team_id, ID, required: false

    def resolve(search: nil, team_id: nil)
      q = Player
      if team_id 
        q = q.joins(:active_roster_spots).where('active_roster_spots.team_id' => team_id, 'active_roster_spots.effective_stop' => nil)
      end
      if search
        q = q.where("name like ?", "%#{search}%")
      else 
        q = q.all 
      end
      q.order(created_at: :desc)
    end
  end
end
