#!/usr/bin/env jruby
require 'java'

require_relative 'test_helper'

Java::Monkstone::NoiseLibrary.new.load(JRuby.runtime, false)
# method tests
class NoiseTest < Minitest::Test
  include SmoothNoise

  def test_noise1d
    x = 0.4
    assert self.respond_to? :noise
    assert (-1.0..1.0).include?(noise(x))
  end

  def test_noise2d
    x = 0.4
    assert (-1.0..1.0).include?(noise(x, Math.sin(x)))
  end

  def test_noise3d
    x = 0.4
    assert (-1.0..1.0).include?(noise(x, Math.sin(x), Math.cos(x)))
  end

  def test_noise4d
    x = 0.4
    assert (-1.0..1.0).include?(noise(x, Math.sin(x), Math.cos(x), rand))
  end

  def test_tnoise3d
    x = 0.4
    assert (-1.0..1.0).include?(tnoise(x, Math.sin(x), Math.cos(x)))
  end

  def test_tnoise4d
    x = 0.4
    assert (-1.0..1.0).include?(tnoise(x, Math.sin(x), Math.cos(x), rand))
  end
end
