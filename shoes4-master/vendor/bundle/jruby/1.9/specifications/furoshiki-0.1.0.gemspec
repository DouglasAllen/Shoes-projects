# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "furoshiki"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Klabnik"]
  s.date = "2013-03-12"
  s.description = "Create .app, .exe, and $LINUX_PACKAGE versions of your application, with its own embedded Ruby."
  s.email = "steve@steveklabnik.com"
  s.homepage = "http://github.com/steveklabnik/furoshiki"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Package and distribute applications with Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<warbler>, [">= 0"])
      s.add_runtime_dependency(%q<plist>, [">= 0"])
    else
      s.add_dependency(%q<warbler>, [">= 0"])
      s.add_dependency(%q<plist>, [">= 0"])
    end
  else
    s.add_dependency(%q<warbler>, [">= 0"])
    s.add_dependency(%q<plist>, [">= 0"])
  end
end
