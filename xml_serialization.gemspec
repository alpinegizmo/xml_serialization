# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xml_serialization}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Larry Baltz", "David Anderson"]
  s.date = %q{2009-02-22}
  s.description = %q{Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers.}
  s.email = %q{david@folklogic.com}
  s.files = ["VERSION.yml", "lib/xml_serialization.rb", "test/xml_serialization_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/alpinegizmo/xml_serialization}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
