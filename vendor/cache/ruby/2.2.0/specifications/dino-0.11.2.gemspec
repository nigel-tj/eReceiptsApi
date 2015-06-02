# -*- encoding: utf-8 -*-
# stub: dino 0.11.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dino"
  s.version = "0.11.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Austinbv"]
  s.date = "2013-06-09"
  s.description = "A utility library for interfacting with an Arduino.\n  Designed for control, expansion, and with love."
  s.email = ["austinbv@gmail.com"]
  s.executables = ["dino"]
  s.files = ["bin/dino"]
  s.homepage = "https://github.com/austinbv/dino"
  s.rubygems_version = "2.4.6"
  s.summary = "Control your Arduino with Ruby."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<serialport>, [">= 0"])
    else
      s.add_dependency(%q<serialport>, [">= 0"])
    end
  else
    s.add_dependency(%q<serialport>, [">= 0"])
  end
end
