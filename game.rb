require "./deck"
require "./player"

class Game
  def initialize
    @deck = Deck.new()
    @deck.shuffle!
  end

  def start
    table = []
    print "TRUMP: ", @deck.trump.suit
    @player_1 = Player.new(@deck.shift(6), @deck.trump)
    @player_2 = Player.new(@deck.shift(6), @deck.trump)
    table << @player_1.move #додавання в масив або в стрінг
    print "\nTABLE: "
    p table
    @player_2.defense(table.last)
    @player_1.add(table)
  end
end

game = Game.new
game.start
