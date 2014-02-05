# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jruby-lint"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Sieger"]
  s.date = "2013-02-26"
  s.description = "This utility presents hints and suggestions to\n  give you an idea of potentially troublesome spots in your code and\n  dependencies that keep your code from running efficiently on JRuby.\n\n  Most pure Ruby code will run fine, but the two common areas that\n  trip people up are native extensions and threading"
  s.email = ["nick@nicksieger.com"]
  s.executables = ["jrlint"]
  s.files = ["bin/jrlint"]
  s.homepage = "https://github.com/jruby/jruby-lint"
  s.licenses = ["EPL 1.0", "GPL 2", "LGPL 2.1"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "jruby-lint"
  s.rubygems_version = "1.8.24"
  s.summary = "See how ready your Ruby code is to run on JRuby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_runtime_dependency(%q<jruby-openssl>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.0.beta.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.5"])
      s.add_development_dependency(%q<rspec-given>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
    else
      s.add_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_dependency(%q<jruby-openssl>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.0.beta.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.5"])
      s.add_dependency(%q<rspec-given>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
    end
  else
    s.add_dependency(%q<term-ansicolor>, [">= 0"])
    s.add_dependency(%q<jruby-openssl>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.0.beta.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.5"])
    s.add_dependency(%q<rspec-given>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
  end
end
