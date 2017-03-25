# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "aerospike"
  s.version = "1.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Khosrow Afroozeh"]
  s.date = "2016-02-11"
  s.description = "Official Aerospike Client for ruby. Access your Aerospike cluster with ease of Ruby."
  s.email = ["khosrow@aerospike.com"]
  s.homepage = "http://www.github.com/aerospike/aerospike-client-ruby"
  s.licenses = ["Apache2.0"]
  s.post_install_message = "Thank you for using Aerospike!\nYou can report issues on github.com/aerospike/aerospike-client-ruby"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "1.8.24"
  s.summary = "An Aerospike driver for Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<msgpack>, ["~> 0.5"])
      s.add_runtime_dependency(%q<bcrypt>, ["~> 3.1"])
    else
      s.add_dependency(%q<msgpack>, ["~> 0.5"])
      s.add_dependency(%q<bcrypt>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<msgpack>, ["~> 0.5"])
    s.add_dependency(%q<bcrypt>, ["~> 3.1"])
  end
end
