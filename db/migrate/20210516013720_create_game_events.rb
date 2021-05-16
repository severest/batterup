class CreateGameEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :game_events do |t|
      t.references :at_bat, null: false, foreign_key: true
      t.string :type, null: false
      t.text :meta

      t.timestamps
    end
  end
end
