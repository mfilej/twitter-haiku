require 'normalizer'

class Haiku
  
  def self.rewrite(data)
    Rewriter.new(data).rewrite
  end
  
  class Rewriter
    
    attr_reader :data, :hashes
    
    def initialize(data)
      @data = data
      @hashes = []
    end
    
    def rewrite
      doc = Nokogiri::XML(data)

      entries = doc.css "entry"

      entries.each do |entry|
        title = entry.at("title")
        raw = title.inner_html
        h = Haiku::Normalizer.normalize(raw)
        hash = h.hash
        if h.haiku? and !hashes.include?(hash)
          title.content = h
          hashes << hash
        else
          entry.remove
        end
      end
    
      doc      
    end
    
  end
  
end