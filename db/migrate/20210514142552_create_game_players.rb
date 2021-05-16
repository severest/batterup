class CreateGamePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :game_players do |t|
      t.references :player, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.decimal :start_inning, precision: 2, scale: 1
      t.decimal :end_inning, precision: 2, scale: 1
      t.integer :fielding_position
      t.integer :batting_order_position
      t.integer :jersey_number

      t.timestamps
    end
  end
end
