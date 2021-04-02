#!/usr/bin/env jruby
require 'java'

require_relative 'test_helper'

Java::Monkstone::NoiseLibrary.new.load(JRuby.runtime, false)
# method tests
class NoiseTest < Minitest::Test
  include SmoothNoise

  VALS = [0.4, 0.5, 4, 5].freeze

  def test_noise1d

    assert self.respond_to? :noise
    VALS.each do |x|
      assert (-1.0..1.0).include?(noise(x))
    end
  end

  def test_noise2d
    VALS.each do |x|
      assert (-1.0..1.0).include?(noise(x, Math.sin(x)))
    end
  end

  def test_noise3d
    VALS.each do |x|
      assert (-1.0..1.0).include?(noise(x, Math.sin(x), Math.cos(x)))
    end
  end

  def test_noise4d
    VALS.each do |x|
      assert (-1.0..1.0).include?(noise(x, Math.sin(x), Math.cos(x), rand))
    end
  end

  def test_tnoise2d
    VALS.each do |x|
      assert (-1.0..1.0).include?(tnoise(x, Math.sin(x)))
    end
  end

  def test_tnoise3d
    VALS.each do |x|
      assert (-1.0..1.0).include?(tnoise(x, Math.sin(x), Math.cos(x)))
    end
  end

  def test_tnoise4d
    VALS.each do |x|
      assert (-1.0..1.0).include?(tnoise(x, Math.sin(x), Math.cos(x), rand))
    end
  end
end
