require 'rake'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "xml_serialization"
    gem.summary = %Q{Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers.}
    gem.email = "david@folklogic.com"
    gem.homepage = "http://github.com/alpinegizmo/xml_serialization"
    gem.description = "Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers."
    gem.authors = ["Larry Baltz", "David Anderson"]
    gem.add_dependency 'builder'
    gem.add_dependency 'activesupport'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc 'Test the xml_serialization gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Default: run unit tests.'
task :default => :test
