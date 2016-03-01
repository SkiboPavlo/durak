class Card
  include Comparable

  NUMBERS = [6,7,8,9,10,11,12,13,14] #константа
  SUITS = [:spades, :diamonds, :hearts, :clubs]

  attr_reader :number, :suit

  def initialize(number, suit)
    @number = number   if number.is_a?(Numeric) && NUMBERS.include?(number)
    @suit = suit       if suit.is_a?(Symbol) && SUITS.include?(suit)
  end

  def <=>(other)
    self.number <=> other.number
  end

end
