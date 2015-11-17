require 'avoid_metreon/event'
require 'avoid_metreon/null_event'
require 'avoid_metreon/moscone_event_crawler'

module AvoidMetreon
  # Uses the provided crawler to load events.
  class EventLoader
    def initialize(crawler: MosconeEventCrawler.new)
      @crawler = crawler
    end

    def for_date(date)
      events.find { |event| event.in_range?(date) } || NullEvent.new
    end

    def events
      crawler_data.map { |item| create_event(item) }
    end

    private

    def crawler_data
      @crawler.crawl['items'] || []
    end

    def create_event(item)
      AvoidMetreon::Event.new(
        name: item['name'],
        start_date: item['start_date'],
        end_date: item['end_date'],
        url: item['url']
      )
    end
  end
end
