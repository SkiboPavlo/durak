require 'spec_helper'
require './app/deck'

RSpec.describe Deck do
  let(:subject) { Deck.new }

  example 'it should create 36 unique cards' do
    expect(subject.size).to eq 36
  end

  example 'it should have consistent trump' do
    subject[0] = Card.new(7, :spades)
    5.times do
      expect(subject.trump.suit).to eq :spades
    end
  end

  example 'it should choose trump' do
    expect(subject.trump).to be_a Card
  end

  example 'it should have unique cards' do
    expect(subject.size).to eq subject.uniq.size
  end

end
