# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{casful_authentication_generator}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Hogan"]
  s.date = %q{2009-05-26}
  s.email = %q{brianhogan@napcs.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "casful_authentication_generator.rb",
     "templates/cas.rb",
     "templates/cas_authentication.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/napcs/casful_authentication_generator}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["."]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/casful_authentication_generator_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
