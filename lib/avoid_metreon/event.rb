module AvoidMetreon
  # Represents an event, including its name, start and end dates.
  class Event
    DATE_FORMAT = '%B %d'
    CROWDED_EVENT_KEYWORDS = [
      'Oracle', 'Salesforce', 'Dreamforce', 'Google', 'Apple', 'Amazon', 'AWS',
      'GDC', 'Game Developers Conference'
    ]

    attr_reader :name, :start_date, :end_date, :url

    def initialize(name:, start_date:, end_date:, url:)
      @name = name
      @start_date = start_date
      @end_date = end_date
      @url = url
    end

    def in_range?(date)
      (start_date..end_date).cover?(date)
    end

    def date_range
      if start_date == end_date
        'on ' + start_date.strftime(DATE_FORMAT)
      else
        'from ' + [start_date, end_date]
          .map { |d| d.strftime(DATE_FORMAT) }
          .join(' to ')
      end
    end

    def status
      if crowded?
        'avoid'
      else
        'warn'
      end
    end

    private

    def crowded?
      CROWDED_EVENT_KEYWORDS.any? { |keyword| name.include?(keyword) }
    end
  end
end
