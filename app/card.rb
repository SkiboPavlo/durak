class Card
  attr_reader :number, :suit

  def initialize(number, suit)
    @number = number   if number.is_a? Numeric
    @suit = suit       if suit.is_a? Symbol
  end

end
