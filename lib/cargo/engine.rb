module Cargo
  class Engine < ::Rails::Engine
    isolate_namespace Cargo

    config.generators do |g|
      g.template_engine :haml
      g.stylesheet_engine :sass
      g.javascript_engine :coffee
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.test_framework :rspec, :view_specs => false
      g.form_builder :simple_form
    end
  end
end
