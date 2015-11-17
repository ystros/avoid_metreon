module AvoidMetreon
  # Represents an event, including its name, start and end dates.
  class Event
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

    def status
      'avoid'
    end
  end
end
