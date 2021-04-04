require_relative 'lib/ruby_noise/version'

desc 'Build Jar'
task :default => [:compile, :install, :test]

desc 'Compile'
task :compile do
  system 'mvn package'
end

desc 'Install'
task :install do
  FileUtils.mv "target/jruby_noise-#{Noise::VERSION}.jar", 'lib'
end

desc 'Test'
task :test do
  system 'jruby --dev test/test_fast_noise.rb'
  system 'jruby --dev test/test_smooth_noise.rb'
end
