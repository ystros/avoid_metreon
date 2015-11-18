require 'avoid_metreon/event_loader'
require 'avoid_metreon/haml_renderer'

module AvoidMetreon
  # Looks up events for the given date and outputs the appropriate HTML page.
  class PageGenerator
    def initialize(templates_path:)
      @event_loader = EventLoader.new
      @renderer = HamlRenderer.new(templates_path: templates_path)
    end

    def generate_for_date(date)
      event = @event_loader.for_date(date)
      @renderer.render('index', event: event)
    end
  end
end
