require "test/unit"
require "normalizer"

class NormalizerTest < Test::Unit::TestCase
  
  def test_removes_rts
    assert_equal "one two", normalize("RT one two")
  end
  
  def test_removes_mentions
    assert_equal "moo to", normalize("moo to @mfilej")
  end
  
  def test_removes_mentions_with_colon
    assert_equal "moo!", normalize("@mfilej: moo!")
  end
  
  def test_squashes_newlines_and_spaces
    actual = normalize "
    
    one
    
        two
        
      three
    
    "
    assert_equal "one two three", actual
  end
  
  def test_removes_hashtags
    assert_equal "one three", normalize("one #two three #four")
  end
  
  def test_squeezes_double_slashes
    actual = normalize "this // is almost // a haiku"
    assert_equal "this / is almost / a haiku", actual
  end
  
  def test_discard_non_haikus
    assert !normalize("this haiku / lacks the last part").haiku?
    assert normalize("has / three / parts").haiku?
  end
  
  def test_removes_hyperlinks
    assert_equal "lol!", normalize("lol! http://lol.com/?foo=true")
  end
  
  def test_normalizes_slashes
    assert_equal "one / two / three", normalize("one/two   /  three")
  end
  
  private
  
  def normalize(str)
    Haiku::Normalizer.normalize(str)
  end
  
end