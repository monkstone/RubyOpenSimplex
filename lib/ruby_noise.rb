unless defined? RUBY_OPEN_SIMPLEX
  $LOAD_PATH << File.dirname(__dir__)
  RUBY_OPEN_SIMPLEX = File.dirname(__dir__)
end


Dir["#{RUBY_OPEN_SIMPLEX}/lib/*.jar"].sort.each do |jar|
  require jar
end
