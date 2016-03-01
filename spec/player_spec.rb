require 'spec_helper'
require './app/player'
require './app/deck'

RSpec.describe Player do
  let(:subject) { Player.new(Deck.new) }

  example 'it should have 6 cards' do
    expect(subject.cards.size).to eq 6
  end

  example 'it should to move correctly' do
    expect(subject.move).to eq subject.cards.min
  end

  example 'it should take cards from table' do
    cards_to_take = [Card.new(8, :spades), Card.new(8, :clubs)]
    expect(subject.take_from_table(cards_to_take).size).to eq 8
  end

  example 'it should take cards from deck' do
    subject.cards.pop(3)
    subject.take_from_deck
    expect(subject.cards.size).to eq 6
  end

  example 'it should not take cards from deck' do
    subject.take_from_deck
    expect(subject.cards.size).to eq 6
  end

  example 'it should add cards to table and delete added cards from hand' do
    table = [Card.new(6, :hearts), Card.new(12, :hearts)]
    subject.cards = [
      Card.new(6, :diamonds), Card.new(12, :clubs),
      Card.new(6, :spades), Card.new(13, :spades)
    ]
    cards = subject.add_to_table(table)
    expect(table.map(&:number)).to include(*cards.map(&:number))
    expect(subject.cards).not_to include(*cards)
  end

  example 'it should not add the same card' do
    table = [subject.move]
    expect(subject.add_to_table(table)).not_to eq table.first
  end

  example 'it should defend correctly without trump' do
    card = Card.new(6, :hearts)
    subject.cards = [
      Card.new(6, :diamonds), Card.new(12, :clubs),
      Card.new(6, :spades), Card.new(13, :hearts)
    ]
    def_card = subject.defense(card)
    expect(def_card.number).to be > card.number
    expect(def_card.suit).not_to eq subject.deck.trump.suit
  end

  example 'it should defend correctly with trump' do
    card = Card.new(6, :hearts)
    subject.cards = [
      Card.new(7, :diamonds), Card.new(12, :clubs),
      Card.new(7, :spades), Card.new(13, :clubs)
    ]
    subject.deck.trump = Card.new(6, :spades)
    def_card = subject.defense(card)
    expect(def_card.suit).to eq subject.deck.trump.suit
  end

end
