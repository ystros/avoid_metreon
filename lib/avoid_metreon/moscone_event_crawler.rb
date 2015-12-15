require 'wombat'

module AvoidMetreon
  # Crawls the current event list for Moscone Center in San Francisco, CA
  class MosconeEventCrawler
    include Wombat::Crawler

    CALENDAR_URL = 'http://www.moscone.com/site/do/event/list'

    base_url CALENDAR_URL

    items 'xpath=//table[@id=\'list\']/tr[td[4]]', :iterator do
      start_date xpath: 'td[1]' do |d|
        Date.strptime(d.split(' - ').first, '%m/%d/%y')
      end
      end_date xpath: 'td[1]' do |d|
        Date.strptime(d.split(' - ').last, '%m/%d/%y')
      end
      name xpath: 'td[2]/a'
      url xpath: 'td[2]/a/@href' do |path|
        "http://www.moscone.com#{path}"
      end
    end
  end
end
