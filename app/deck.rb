require "./app/card"
require 'rubygems'
require 'byebug'
class Deck < Array #наслідування

  def initialize # конструктор
    Card::NUMBERS.each do |n|
      Card::SUITS.each do |s|
        self << Card.new(n, s) # self -> завжди ззсилається на поточний обєкт
        # створює 36 унікальних карт
      end
    end

    self.shuffle!
  end

  def trump
    @trump ||= self.shift
    # ||= ->if nil то присвоюєм, якшо ні то пропускаємо
  end

  def trump=(card)
    # WARNING!!!
    # ONLY FOR TESTING REASONS!!!
    @trump = card
  end
end
