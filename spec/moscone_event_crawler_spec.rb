require 'spec_helper'
require 'avoid_metreon/moscone_event_crawler'

describe AvoidMetreon::MosconeEventCrawler do
  let(:crawler) { AvoidMetreon::MosconeEventCrawler.new }
  let(:items) { (crawler.crawl || {})['items'] || [] }

  def stub_calendar_request(body_file)
    file_name = File.expand_path("../data/#{body_file}.html", __FILE__)
    page_content = File.read(file_name)
    stub_request(:get, AvoidMetreon::MosconeEventCrawler::CALENDAR_URL)
      .to_return(body: page_content)
  end

  describe '#crawl' do
    describe 'with full calendar data' do
      let(:item) { items.first }

      before do
        stub_calendar_request('full_calendar')
      end

      it 'parses the start date' do
        expect(item['start_date']).to eq(Date.civil(2015, 12, 20))
      end

      it 'parses the end date' do
        expect(item['end_date']).to eq(Date.civil(2015, 12, 25))
      end

      it 'parses the event name' do
        expect(item['name']).to eq('American Geophysical Union')
      end
    end

    describe 'with no events' do
      before do
        stub_calendar_request('no_events')
      end

      it 'returns an empty list' do
        expect(items).to be_empty
      end
    end
  end
end
