module AvoidMetreon
  # Represents an event, including its name, start and end dates.
  class Event
    DATE_FORMAT = '%B %d'
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
        start_date.strftime(DATE_FORMAT)
      else
        [start_date, end_date]
          .map { |d| d.strftime(DATE_FORMAT) }
          .join(' to ')
      end
    end

    def status
      'avoid'
    end
  end
end
