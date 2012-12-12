# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bundler"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andr\u{c3}\u{a9} Arko", "Terence Lee", "Carl Lerche", "Yehuda Katz"]
  s.date = "2012-08-30"
  s.description = "Bundler manages an application's dependencies through its entire life, across many machines, systematically and repeatably"
  s.email = ["andre@arko.net"]
  s.executables = ["bundle"]
  s.files = ["bin/bundle"]
  s.homepage = "http://gembundler.com"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "bundler"
  s.rubygems_version = "1.8.24"
  s.summary = "The best way to manage your application's dependencies"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<ronn>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<ronn>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<ronn>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
