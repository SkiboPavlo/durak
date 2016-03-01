require "./app/deck"
require "./app/player"

class Game
  def initialize
    @deck = Deck.new()
  end

  def start
    table = []
    print "TRUMP: ", @deck.trump.suit
    @player_1 = Player.new(@deck)
    @player_2 = Player.new(@deck)
    table << @player_1.move #додавання в масив або в стрінг
    print "\nTABLE: "
    p table
    @player_2.defense(table.last)
    @player_1.add_to_table(table)
  end
end

game = Game.new
game.start
