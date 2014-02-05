# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "swt"
  s.version = "0.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Lucraft"]
  s.date = "2013-07-01"
  s.description = "Contains everything required to write cross-platform desktop applications with JRuby and SWT."
  s.email = ["dan@fluentradical.com"]
  s.executables = ["swt_cucumber"]
  s.files = ["bin/swt_cucumber"]
  s.homepage = "http://github.com/danlucraft/swt"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "The SWT toolkit for JRuby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
