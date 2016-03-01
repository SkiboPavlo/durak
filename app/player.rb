require 'rubygems'
require 'byebug'

class Player

  def initialize(cards, trump)
    @cards = cards
    @trump = trump
  end

  def move
    @cards.shift
  end

  def defense(card)
    def_cards = @cards.select { |c| c.number > card.number && c.suit == card.suit}
    if def_cards.empty?
      card_to_defence = @cards.select { |c| c.suit == @trump.suit && c.number > card.number }.first
    else
      card_to_defence = def_cards.first
    end
    print "DEFENSE CARDS: "
    p card_to_defence

    if card_to_defence.nil?
      take(card)
    end
  end

  def add(table)
    # TODO fix to use cards objects, not numbers
    print "ADDING CARDS: "
    my_cards_nums = @cards.map { |c| c.number }
    table_nums = table.map { |c| c.number }
    add_cards = my_cards_nums & table_nums

    p add_cards
  end

  def take(card)
    print "TAKING CARD: "
    @cards.unshift(card)
    p card
  end

end
