# -*- encoding: utf-8 -*-
# stub: composite_primary_keys 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "composite_primary_keys"
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dr Nic Williams", "Charlie Savage"]
  s.date = "2010-12-17"
  s.description = "Composite key support for ActiveRecord 3"
  s.email = ["drnicwilliams@gmail.com"]
  s.homepage = "http://github.com/cfis/composite_primary_keys"
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "compositekeys"
  s.rubygems_version = "2.4.6"
  s.summary = "Composite key support for ActiveRecord"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.3"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
