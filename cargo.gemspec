$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "cargo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cargo"
  s.version     = Cargo::VERSION
  s.authors     = ["Rawane ZOSSOU"]
  s.email       = ["dev@raw1z.fr"]
  s.homepage    = "TODO"
  s.summary     = "Wiki engine"
  s.description = "Wiki engine based on Rails 3 engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "compass", ">= 0.12.alpha.4"
  s.add_dependency "coffee-rails"
  s.add_dependency "execjs"
  s.add_dependency "paper_trail"
  s.add_dependency "simple_form"
  s.add_dependency "factory_girl_rails"
  s.add_dependency "faker"
  s.add_dependency "rails3-generators"
  s.add_dependency "devise", "~> 2.0.0.rc"
  s.add_dependency "cancan"
  s.add_dependency "redcarpet"
  s.add_dependency "awesome_print"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "launchy"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "eventmachine"#, ">= 1.0.0.beta.4.1"
  s.add_development_dependency "thin"
end
