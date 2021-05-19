class CreateActiveRosterPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :active_roster_players do |t|
      t.references :team, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.datetime :effective_start
      t.datetime :effective_stop

      t.timestamps
    end
  end
end
