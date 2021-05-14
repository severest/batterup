class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :away_team, null: false, foreign_key: { to_table: :teams }
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :stadium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
