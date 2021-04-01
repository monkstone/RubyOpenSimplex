#!/usr/bin/env jruby
require 'java'

require_relative 'test_helper'

Java::Monkstone::NoiseLibrary.new.load(JRuby.runtime, false)
# method tests
class NoiseTest < Minitest::Test
  include FastNoise

  def test_noise1d
    x = 0.4
    assert self.respond_to? :noise
  end
end
