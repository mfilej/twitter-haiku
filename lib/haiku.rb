require 'normalizer'

class Haiku
  
  def self.rewrite(data)
    doc = Nokogiri::XML(data)

    entries = doc.css "entry"

    entries.each do |entry|
      title = entry.at("title")
      raw = title.inner_html
      h = Haiku::Normalizer.normalize(raw)
      next unless h.haiku?
      title.content = h
    end
    
    doc
  end
  
end