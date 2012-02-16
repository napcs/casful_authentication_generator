# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{casful_authentication_generator}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Hogan"]
  s.date = %q{2011-02-14}
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
     "lib/generators/casful_authentication_generator.rb",
     "lib/generators/templates/cas.rb",
     "lib/generators/templates/cas_authentication.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/ottai/casful_authentication_generator}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{casfulauth}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Generator to quickly put CAS authentication on your Rails application. Provides a currnet_user method to controllers and views to make it work like Restful Authentication and other plugins. }
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
