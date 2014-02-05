# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "log4jruby"
  s.version = "0.5.0"
  s.platform = "java"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lenny Marks"]
  s.date = "2012-11-25"
  s.description = "Ruby Logger using Log4j, geared toward those who use JRuby to write Ruby code using/extending Java code. Ruby and Java are configured together using traditional Log4j methods."
  s.email = ["lenny@aps.org"]
  s.homepage = "https://github.com/lenny/log4jruby"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Log4jruby is a thin wrapper around the Log4j Logger. It is geared more toward  those who are using JRuby to integrate with and build on top of Java code that  uses Log4j. The Log4jruby::Logger provides an interface much like the standard  ruby Logger. Your ruby loggers are given a .jruby prefix and can be configured  along with the loggers for your Java code."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
