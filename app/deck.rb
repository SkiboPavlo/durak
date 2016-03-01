require "./app/card"

class Deck < Array #наслідування

  def initialize # конструктор
    Card::NUMBERS.each do |n|
      Card::SUITS.each do |s|
        self << Card.new(n, s) # self -> завжди ззсилається на поточний обєкт
        # створює 36 унікальних карт
      end
    end
  end

  def trump
    @trump ||= self.shift
    # ||= ->if nil то присвоюєм, якшо ні то пропускаємо
  end
end
