# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_16_015056) do

  create_table "at_bats", charset: "utf8", force: :cascade do |t|
    t.bigint "batter_id", null: false
    t.bigint "pitcher_id", null: false
    t.bigint "game_id", null: false
    t.string "batter_side_of_plate", limit: 1, null: false
    t.decimal "inning", precision: 2, scale: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batter_id"], name: "index_at_bats_on_batter_id"
    t.index ["game_id"], name: "index_at_bats_on_game_id"
    t.index ["pitcher_id"], name: "index_at_bats_on_pitcher_id"
  end

  create_table "game_event_players", charset: "utf8", force: :cascade do |t|
    t.bigint "game_event_id", null: false
    t.bigint "game_player_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_event_id"], name: "index_game_event_players_on_game_event_id"
    t.index ["game_player_id"], name: "index_game_event_players_on_game_player_id"
  end

  create_table "game_events", charset: "utf8", force: :cascade do |t|
    t.bigint "at_bat_id", null: false
    t.string "type", null: false
    t.text "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["at_bat_id"], name: "index_game_events_on_at_bat_id"
  end

  create_table "game_players", charset: "utf8", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.bigint "team_id", null: false
    t.decimal "start_inning", precision: 2, scale: 1
    t.decimal "end_inning", precision: 2, scale: 1
    t.integer "fielding_position"
    t.integer "batting_order_position"
    t.integer "jersey_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
    t.index ["team_id"], name: "index_game_players_on_team_id"
  end

  create_table "games", charset: "utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "away_team_id", null: false
    t.bigint "home_team_id", null: false
    t.bigint "stadium_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["stadium_id"], name: "index_games_on_stadium_id"
  end

  create_table "players", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stadia", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "at_bats", "game_players", column: "batter_id"
  add_foreign_key "at_bats", "game_players", column: "pitcher_id"
  add_foreign_key "at_bats", "games"
  add_foreign_key "game_event_players", "game_events"
  add_foreign_key "game_event_players", "game_players"
  add_foreign_key "game_events", "at_bats"
  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "players"
  add_foreign_key "game_players", "teams"
  add_foreign_key "games", "stadia"
  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
end
