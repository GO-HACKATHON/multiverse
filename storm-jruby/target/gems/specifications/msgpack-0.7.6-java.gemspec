# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "msgpack"
  s.version = "0.7.6"
  s.platform = "java"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sadayuki Furuhashi", "Theo Hultberg", "Satoshi Tagomori"]
  s.date = "2016-05-10"
  s.description = "MessagePack is a binary-based efficient object serialization library. It enables to exchange structured objects between many languages like JSON. But unlike JSON, it is very fast and small."
  s.email = ["frsyuki@gmail.com", "theo@iconara.net", "tagomoris@gmail.com"]
  s.homepage = "http://msgpack.org/"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "msgpack"
  s.rubygems_version = "1.8.24"
  s.summary = "MessagePack, a binary-based efficient data interchange format."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.9.4"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.2"])
      s.add_development_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.9.4"])
      s.add_dependency(%q<rspec>, ["~> 3.3"])
      s.add_dependency(%q<yard>, ["~> 0.8.2"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.9.4"])
    s.add_dependency(%q<rspec>, ["~> 3.3"])
    s.add_dependency(%q<yard>, ["~> 0.8.2"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end