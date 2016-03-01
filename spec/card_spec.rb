require 'rubygems'
require './app/card'
require 'rspec'

RSpec.describe Card do
  example do
    expect(described_class).to equal(Card)
  end
end
