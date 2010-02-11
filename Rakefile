task :default => :build

task :build => :clean do
  system "context haiku.tex"
end

task :clean do
  rm_if_exist %w(haiku.pdf haiku.tuc haiku.log)
end

task :fetch do
  rm_if_exist "data/haiku.atom"
  system "curl -o data/haiku.atom http://search.twitter.com/search.atom?q=%23haiku"
end


def rm_if_exist(paths)
  Array(paths).each do |path|
    rm path if File.file? path
  end
end