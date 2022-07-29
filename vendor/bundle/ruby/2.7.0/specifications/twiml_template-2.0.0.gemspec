# -*- encoding: utf-8 -*-
# stub: twiml_template 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "twiml_template".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Phil Nash".freeze]
  s.date = "2019-11-10"
  s.description = "An easy way to work with TwiML for responding to Twilio webhooks in Rails or Sinatra applications using template files.".freeze
  s.email = ["philnash@gmail.com".freeze]
  s.homepage = "https://github.com/philnash/twiml_template".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "TwiML templates for Rails and Tilt.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<tilt>.freeze, [">= 1.3", "< 3"])
    s.add_runtime_dependency(%q<twilio-ruby>.freeze, [">= 5.28", "< 6.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.7", "< 3.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.12"])
    s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_development_dependency(%q<sinatra>.freeze, [">= 1.3"])
    s.add_development_dependency(%q<equivalent-xml>.freeze, ["~> 0.6.0"])
  else
    s.add_dependency(%q<tilt>.freeze, [">= 1.3", "< 3"])
    s.add_dependency(%q<twilio-ruby>.freeze, [">= 5.28", "< 6.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.7", "< 3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.12"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra>.freeze, [">= 1.3"])
    s.add_dependency(%q<equivalent-xml>.freeze, ["~> 0.6.0"])
  end
end
