require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "nucms"
    s.summary = %Q{TODO}
    s.email = "jcapote@gmail.com"
    s.homepage = "http://github.com/jcapote/nucms"
    s.description = "A lightweight, content management system built out of various rack middleware"
    s.authors = ["jcapote"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/test_*.rb']
    t.verbose = true
  end
rescue LoadError
  puts "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
end

task :default => :test
