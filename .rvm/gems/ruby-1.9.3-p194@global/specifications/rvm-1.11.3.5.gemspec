# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rvm"
  s.version = "1.11.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wayne E. Seguin", "Michal Papis"]
  s.date = "2012-07-02"
  s.description = "RVM ~ Ruby Environment Manager ~ Ruby Gem Library."
  s.email = ["wayneeseguin@gmail.com", "mpapis@gmail.com"]
  s.homepage = "https://rvm.beginrescueend.com/"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "RVM Ruby Gem Library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
