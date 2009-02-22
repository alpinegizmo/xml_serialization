$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'test/unit'
require 'xml_serialization'

class TestXMLSerialization < Test::Unit::TestCase

  def test_rawxml_should_pass_thru
    rawxml = RawXML.new '<tag>content</tag>'
    assert_equal rawxml, rawxml.to_xml
  end
  
  def test_fixnum
    assert_equal '<fixnum>1</fixnum>', 1.to_xml
  end

  def test_string
    assert_equal '<string>abc</string>', 'abc'.to_xml
  end

  def test_symbol
    assert_equal '<symbol>abc</symbol>', :abc.to_xml
  end
  
  def test_array_of_strings
    expected = <<EXPECTED
<?xml version="1.0" encoding="UTF-8"?>
<strings type="array">
  <string>a</string>
  <string>b</string>
  <string>c</string>
</strings>
EXPECTED
    assert_equal expected, ['a', 'b', 'c'].to_xml
  end
  
  def test_array_of_fixnums_with_root_tag_specified
    expected = <<EXPECTED
<?xml version="1.0" encoding="UTF-8"?>
<numbers type="array">
  <number>1</number>
  <number>2</number>
  <number>3</number>
</numbers>
EXPECTED
    assert_equal expected, [1, 2, 3].to_xml(:root => 'numbers')
  end
  
  # this case is used by xslt_render to serialize the hash of controller instance variable values
  def test_hash_with_array
    expected = <<EXPECTED
<?xml version="1.0" encoding="UTF-8"?>
<hash>
  <numbers type="array">
    <number>1</number>
    <number>2</number>
  </numbers>
</hash>
EXPECTED
    assert_equal expected, {'numbers' => [1, 2]}.to_xml
    assert_equal expected, {'numbers' => ['1', '2']}.to_xml
  end
  
end
