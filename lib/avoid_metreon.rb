require 'rubygems'
require 'bundler/setup'
require 'avoid_metreon/event_loader'

result = AvoidMetreon::EventLoader.new.for_date(Date.today)

pp result
