require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => [:prepare, :build]

desc "Build the pdf file"
task :build => :clean do
  system "context haiku.tex"
end

desc "Remove generated pdf and temporary files"
task :clean do
  rm_if_exist %w(haiku.pdf haiku.tuc haiku.log)
end

desc "Fetch a fresh twitter feed"
task :fetch do
  rm_if_exist "data/source.atom"
  system %x{curl -o data/source.atom "http://search.twitter.com/search.atom?q=%23haiku&rpp=50"}
end

desc "Rewrites the twitter feed by normalizing tweets"
task :prepare => :fetch do
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