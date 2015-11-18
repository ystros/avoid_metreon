require 'rubygems'
require 'bundler/setup'
require 'avoid_metreon/page_generator'

module AvoidMetreon
  def self.execute
    date = if ARGV[0].nil?
      Date.today
    else
      Date.parse(ARGV[0])
    end
    templates_path = File.expand_path('../../templates/', __FILE__)
    generator = PageGenerator.new(templates_path: templates_path)
    puts generator.generate_for_date(date)
  end
end
