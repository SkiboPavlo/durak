require 'rubygems'
require 'byebug'

class Player

  attr_reader :deck
  attr_accessor :cards

  def initialize(deck)
    @cards = deck.shift(6)
    @deck = deck
  end

  def move
    @cards.sort!.shift
  end

  #TODO переписати цей метод, шоб він приймав не 1 карту, а стіл (відповідно)
  #метод має повертати не 1 карту а таку саму кількість карт якими походили.
  def defense(card)
    # якщо гравець має карту якою може перевести, то викликаємо метод redirect,
    # якщо не має чим перевести то відбивається далі.
    def_cards = @cards.select { |c| c.number > card.number && c.suit == card.suit}
    if def_cards.empty?
      card_to_defence = @cards.select { |c| c.suit == @deck.trump.suit && c.number > card.number }.first
    else
      card_to_defence = def_cards.first
    end
    print "DEFENSE CARDS: "
    p card_to_defence

    if card_to_defence.nil?
      take_from_table([card])
    end

    card_to_defence
  end

  def redirect(card)
    #TODOнаписати метод переводу карти і покрити тестами.
  end

  def add_to_table(table)
    cards_to_add = @cards.select { |c| table.map(&:number).include? c.number }

    unless cards_to_add.empty?
      print "ADDING CARDS: "
      p cards_to_add
    end
    @cards.delete_if {|card| cards_to_add.include? card}
    cards_to_add
  end

  def take_from_deck
    if cards.size < 6
      q = 6 - cards.size
      @cards.unshift(deck.shift(q)).flatten!
    end
  end

  def take_from_table(cards)
    print "TAKING CARDS: "
    p cards
    @cards.unshift(cards).flatten!
  end

end
