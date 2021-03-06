# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "warbler"
  s.version = "1.3.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Sieger"]
  s.date = "2013-05-09"
  s.description = "Warbler is a gem to make a Java jar or war file out of any Ruby,\nRails, Merb, or Rack application. Warbler provides a minimal,\nflexible, Ruby-like way to bundle up all of your application files for\ndeployment to a Java environment."
  s.email = "nick@nicksieger.com"
  s.executables = ["warble"]
  s.files = ["bin/warble"]
  s.homepage = "http://caldersphere.rubyforge.org/warbler"
  s.rdoc_options = ["--main", "README.rdoc", "-H", "-f", "darkfish"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "caldersphere"
  s.rubygems_version = "1.8.24"
  s.summary = "Warbler chirpily constructs .war files of your Rails applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.9.6"])
      s.add_runtime_dependency(%q<jruby-jars>, [">= 1.5.6"])
      s.add_runtime_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
    else
      s.add_dependency(%q<rake>, [">= 0.9.6"])
      s.add_dependency(%q<jruby-jars>, [">= 1.5.6"])
      s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.8"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.9.6"])
    s.add_dependency(%q<jruby-jars>, [">= 1.5.6"])
    s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.8"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
  end
end
