class CreateGameEventPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :game_event_players do |t|
      t.references :game_event, null: false, foreign_key: true
      t.references :game_player, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end
