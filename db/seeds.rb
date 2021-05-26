puts "Seeding..."

Stadium.where(name: "Rogers Centre",  address: "1 Blue Jays Way, Toronto, Ontario").first_or_create
Stadium.where(name: "Yankee Stadium",  address: "1 East 161st Street, The Bronx, New York").first_or_create

blue_jays = Team.where(name: "Toronto Blue Jays").first_or_create
yankees = Team.where(name: "New York Yankees").first_or_create

toronto_players = [
  Player.where(name: "Jeremy Beasley").first_or_create,
  Player.where(name: "Travis Bergen").first_or_create,
  Player.where(name: "Tyler Chatwood").first_or_create,
  Player.where(name: "A.J. Cole").first_or_create,
  Player.where(name: "Rafael Dolis").first_or_create,
  Player.where(name: "Anthony Kay").first_or_create,
  Player.where(name: "Steven Matz").first_or_create,
  Player.where(name: "Tim Mayza").first_or_create,
  Player.where(name: "Joel Payamps").first_or_create,
  Player.where(name: "Robbie Ray").first_or_create,
  Player.where(name: "Jordan Romano").first_or_create,
  Player.where(name: "Hyun Jin Ryu").first_or_create,
  Player.where(name: "Ross Stripling").first_or_create,
  Player.where(name: "Trent Thornton").first_or_create,
  Player.where(name: "Danny Jansen").first_or_create,
  Player.where(name: "Reese McGuire").first_or_create,
  Player.where(name: "Bo Bichette").first_or_create,
  Player.where(name: "Cavan Biggio").first_or_create,
  Player.where(name: "Santiago Espinal").first_or_create,
  Player.where(name: "Vladimir Guerrero Jr.").first_or_create,
  Player.where(name: "Marcus Semien").first_or_create,
  Player.where(name: "Rowdy Tellez").first_or_create,
  Player.where(name: "Jonathan Davis").first_or_create,
  Player.where(name: "Randal Grichuk").first_or_create,
  Player.where(name: "Lourdes Gurriel Jr.").first_or_create,
  Player.where(name: "Teoscar Hernández").first_or_create,
]

yankee_players = [
  Player.where(name: "Luis Cessa").first_or_create,
  Player.where(name: "Aroldis Chapman").first_or_create,
  Player.where(name: "Gerrit Cole").first_or_create,
  Player.where(name: "Domingo Germán").first_or_create,
  Player.where(name: "Chad Green").first_or_create,
  Player.where(name: "Michael King").first_or_create,
  Player.where(name: "Corey Kluber").first_or_create,
  Player.where(name: "Jonathan Loaisiga").first_or_create,
  Player.where(name: "Lucas Luetge").first_or_create,
  Player.where(name: "Jordan Montgomery").first_or_create,
  Player.where(name: "Wandy Peralta").first_or_create,
  Player.where(name: "Jameson Taillon").first_or_create,
  Player.where(name: "Justin Wilson").first_or_create,
  Player.where(name: "Kyle Higashioka").first_or_create,
  Player.where(name: "Gary Sánchez").first_or_create,
  Player.where(name: "Mike Ford").first_or_create,
  Player.where(name: "Rougned Odor").first_or_create,
  Player.where(name: "Gleyber Torres").first_or_create,
  Player.where(name: "Gio Urshela").first_or_create,
  Player.where(name: "Luke Voit").first_or_create,
  Player.where(name: "Tyler Wade").first_or_create,
  Player.where(name: "Miguel Andújar").first_or_create,
  Player.where(name: "Clint Frazier").first_or_create,
  Player.where(name: "Brett Gardner").first_or_create,
  Player.where(name: "Aaron Judge").first_or_create,
]

toronto_players.each do |player|
  ActiveRosterPlayer.where(team: blue_jays, player: player).first_or_create
end
yankee_players.each do |player|
  ActiveRosterPlayer.where(team: yankees, player: player).first_or_create
end

puts "DONE"
