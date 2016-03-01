require "./card"

class Deck < Array #наслідування

  NUMBERS = [6,7,8,9,10,11,12,13,14] #константа
  SUITS = [:spades, :diamonds, :hearts, :clubs]

  def initialize # конструктор
    NUMBERS.each do |n|
      SUITS.each do |s|
        self << Card.new(n, s)
        # self -> завжди ззсилається на поточний обєкт
      end
    end
  end

  def trump
    @trump ||= self.shift
    # ||= ->if nil то присвоюєм, якшо ні то пропускаємо
  end
end


