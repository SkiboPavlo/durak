require 'spec_helper'
require './app/card'

RSpec.describe Card do
  example 'it should test Card class' do
    expect(described_class).to equal(Card)
  end

  example 'it should successfully initialize object' do
    expect(Card.new(6, :spades).number).to eq 6
    expect(Card.new(6, :spades).suit).to eq :spades
  end

  example 'it should set only valid attributes' do
    expect(Card.new(3, :spades).number).to be_nil
    expect(Card.new(6, :spiders).suit).to be_nil
  end

  example 'it should validate initializator attributes' do
    expect(Card.new('6', :spades).number).to be_nil
    expect(Card.new(6, "spades").suit).to be_nil
  end
end
