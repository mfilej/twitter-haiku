require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => :build

task :build => :clean do
  system "context haiku.tex"
end

task :clean do
  rm_if_exist %w(haiku.pdf haiku.tuc haiku.log)
end

task :fetch do
  rm_if_exist "data/source.atom"
  system %x{curl -o data/source.atom "http://search.twitter.com/search.atom?q=%23haiku&rpp=50"}
end

task :normalize do
  $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "lib")
  require "haiku"
  source = open "data/source.atom"
  File.open("data/haiku.atom", "w") do |f|
    f << Haiku.rewrite(source)
  end
end

def rm_if_exist(paths)
  Array(paths).each do |path|
    rm path if File.file? path
  end
end