# Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers.

require 'rubygems'
require 'activesupport'
require 'builder'

module SimpleSerializer
  def to_xml(options={})
    builder = options[:builder] || Builder::XmlMarkup.new(:indent => options[:indent])
    tag = options[:root] || self.class.name.downcase
    dasherize = ! options.has_key?(:dasherize) || options[:dasherize]
    tag = dasherize ? tag.to_s.dasherize : tag
    builder.tag!(tag, self.to_s)
  end
end

class String
  include SimpleSerializer

  XML_HEAD_PATTERN = /\A\s*<\?xml[^>]*>\s*/m
  def strip_xml_head!
    sub!(XML_HEAD_PATTERN, '')
  end

  def strip_xml_head
    sub(XML_HEAD_PATTERN, '')
  end
end

class Symbol
  include SimpleSerializer
end

class Fixnum
  include SimpleSerializer
end

class Builder::XmlMarkup
  def raw_tag!(tag, string)
     _start_tag(tag, {})
     _text string
     _end_tag(tag)
  end
  
  def no_tag!(string)
    _text string
  end
end

# create a string class that doesn't get escaped when dumped into XML stream
class RawXML < String
  def initialize(string, options={})
    @options = options
    super string
  end

  def to_xml(options_arg={})
    options = @options.merge options_arg
    builder = options[:builder] || 
              Builder::XmlMarkup.new(:indent => options[:indent])

    add_tag = options.has_key?(:no_tag) ? !options[:no_tag] : options[:root]
    return builder.no_tag!(self.strip_xml_head) unless add_tag 

    tag = options[:root] || self.class.name.downcase
    dasherize = ! options.has_key?(:dasherize) || options[:dasherize]
    tag = dasherize ? tag.to_s.dasherize : tag

    builder.raw_tag!(tag, self.strip_xml_head)
  end
end
