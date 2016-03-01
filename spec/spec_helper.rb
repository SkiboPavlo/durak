require 'rubygems'
require 'rspec'
require 'byebug'
require 'simplecov'

SimpleCov.profiles.define 'durak' do
  add_filter 'spec'
end

SimpleCov.start 'durak'
