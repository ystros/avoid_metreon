require 'haml'

module AvoidMetreon
  # A simple HAML renderer, that takes a template name and data.
  class HamlRenderer
    attr_reader :templates_path

    def initialize(templates_path:)
      @templates_path = templates_path
    end

    def render(template_name, locals)
      file_name = File.join(templates_path, "#{template_name}.haml")
      engine = Haml::Engine.new(File.read(file_name))
      engine.render(self, locals)
    end
  end
end
