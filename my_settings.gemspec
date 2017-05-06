$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_settings"
  s.version     = MySettings::VERSION
  s.authors     = ["榊間浩人"]
  s.email       = ["h.s.bbjss383@gmail.com"]
  s.summary     = "It generate some settings for rails"
  s.description = "It generate some settings for rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
end
