module Types
  module Input
    class TeamInputType < Types::BaseInputObject
      argument :name, String, required: true
    end
  end
end
