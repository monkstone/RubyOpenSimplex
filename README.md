# RubyOpenSimplex
JRuby Wrapper for OpenSimplex2 (Fast and Smooth) with classic and terrain options

Original java implementation files ported from https://github.com/KdotJPG/OpenSimplex2 by KDotJPG (Kurt Spencer)

![Travis CI](https://api.travis-ci.com/monkstone/RubyOpenSimplex.svg)

NB: SimplexNoise by convention generates values in range `-1.0..1.0` cf Perlin Noise `0..1.0`

To build:-

clone repository then use `rake` to run tasks, and you are done! Create a gem if you want...

Usage:-

```ruby
require_relative "../ruby_noise-#{version}.jar"
Java::Monkstone::NoiseLibrary.new.load(JRuby.runtime, false) # load the module

class YourClass
  include FastNoise
  # include SmoothNoise

  def your_method
    noise(args..) # use one to four Numeric args
    # tnoise(args..) # use two to four Numeric args
    ...
  end
end
```
