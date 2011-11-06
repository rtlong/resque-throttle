require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "fhwang-resque-throttle"
  gem.homepage = "http://github.com/fhwang/resque-throttle"
  gem.license = "MIT"
  gem.summary = %Q{resque-throttle is an extension to the resque queue system that restricts the frequency in which certain jobs are run.}
  gem.description = %Q{resque-throttle is an extension to the resque queue system that restricts the frequency in which certain jobs are run.}
  gem.email = "francis.hwang@profitably.com"
  gem.authors = ["Francis Hwang"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fhwang-resque-throttle #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
