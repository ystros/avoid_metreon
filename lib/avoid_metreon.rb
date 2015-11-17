require 'rubygems'
require 'bundler/setup'
require 'avoid_metreon/moscone_event_crawler'

result = AvoidMetreon::MosconeEventCrawler.new.crawl

pp result
