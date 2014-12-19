# -*- encoding: utf-8 -*-
# stub: activemodel-associations 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "activemodel-associations"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["joker1007"]
  s.date = "2014-06-28"
  s.description = "ActiveRecord Association Helper for PORO (Plain Old Ruby Object)"
  s.email = ["kakyoin.hierophant@gmail.com"]
  s.homepage = "https://github.com/joker1007/activemodel-associations"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "ActiveRecord Association Helper for PORO (Plain Old Ruby Object)"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5"])
      s.add_runtime_dependency(%q<activemodel>, ["< 5"])
      s.add_runtime_dependency(%q<activesupport>, ["< 5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<tapp>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<byebug>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5"])
      s.add_dependency(%q<activemodel>, ["< 5"])
      s.add_dependency(%q<activesupport>, ["< 5"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<tapp>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<byebug>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<pry-byebug>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5"])
    s.add_dependency(%q<activemodel>, ["< 5"])
    s.add_dependency(%q<activesupport>, ["< 5"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<tapp>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<byebug>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<pry-byebug>, [">= 0"])
  end
end
