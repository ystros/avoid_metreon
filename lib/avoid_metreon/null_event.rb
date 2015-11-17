module AvoidMetreon
  # Represents a lack of an event.
  class NullEvent
    def name
      'None'
    end

    def start_date
    end

    def end_date
    end

    def url
    end

    def status
      'okay'
    end

    def in_range?(_date)
      true
    end
  end
end
