require "rubygems"
require "nokogiri"

class Haiku
  class Normalizer < String
    def self.normalize(str)
      new(str).instance_eval do
        remove_retweets
        remove_mentions
        remove_hashtags
        remove_hyperlinks
        squeeze_whitespace
        normalize_slashes
      end
    end
    
    def remove_retweets
      squash /RT\b/
    end
    
    def remove_mentions
      squash /@\w+:?\s?/
    end
    
    def remove_hashtags
      squash /#\w+\b/
    end
    
    def remove_hyperlinks
      squash /https?:\/\/.+\b/i
    end
    
    def squeeze_whitespace
      squash "\n"
      gsub! "  ", " " while include?("  ")
      strip!
      self
    end
    
    def normalize_slashes
      gsub! /\s*\/+\s*/, " / "
      self
    end
    
    def haiku?
      count("/") == 2 and self
    end
    
    private
    
    def squash(pattern)
      gsub! pattern, ""
      self
    end    
  end
end
