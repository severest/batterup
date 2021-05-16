class CreateAtBats < ActiveRecord::Migration[6.1]
  def change
    create_table :at_bats do |t|
      t.references :batter, null: false, foreign_key: { to_table: :game_players }
      t.references :pitcher, null: false, foreign_key: { to_table: :game_players }
      t.references :game, null: false, foreign_key: true
      t.string :batter_side_of_plate, null: false, limit: 1
      t.decimal :inning, precision: 2, scale: 1

      t.timestamps
    end
  end
end
